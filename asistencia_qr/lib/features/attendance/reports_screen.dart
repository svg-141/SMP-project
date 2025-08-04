import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import '../../data/isar_service.dart';
import '../../data/models/asistencia.dart';
import '../../data/models/docente.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  List<Asistencia> _asistencias = [];
  List<Docente> _docentes = [];
  String? _selectedDni;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final isar = await IsarService.isar;
    final docentes = await isar.docentes.where().findAll();
    final asistencias = await isar.asistencias.where().findAll();
    setState(() {
      _docentes = docentes;
      _asistencias = asistencias;
    });
  }

  List<Asistencia> get _filteredAsistencias {
    return _asistencias.where((a) {
      final matchDni = _selectedDni == null || a.docenteDni == _selectedDni;
      final matchDate = _selectedDate == null || (a.fechaHora.year == _selectedDate!.year && a.fechaHora.month == _selectedDate!.month && a.fechaHora.day == _selectedDate!.day);
      return matchDni && matchDate;
    }).toList();
  }

  String _getDocenteNombre(String dni) {
    final docente = _docentes.firstWhere((d) => d.dni == dni, orElse: () => Docente()..dni = dni..nombre = 'Desconocido');
    return docente.nombre;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reportes de Asistencia'),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.yellow[700],
      ),
      backgroundColor: Colors.blue[800],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedDni,
                    decoration: InputDecoration(
                      labelText: 'Docente',
                      filled: true,
                      fillColor: Colors.yellow[100],
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    items: [
                      const DropdownMenuItem(value: null, child: Text('Todos')),
                      ..._docentes.map((d) => DropdownMenuItem(
                            value: d.dni,
                            child: Text('${d.nombre} (${d.dni})'),
                          )),
                    ],
                    onChanged: (value) => setState(() => _selectedDni = value),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Fecha',
                      filled: true,
                      fillColor: Colors.yellow[100],
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: InkWell(
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate ?? DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now(),
                          builder: (context, child) => Theme(
                            data: ThemeData.light().copyWith(
                              colorScheme: ColorScheme.light(
                                primary: Colors.blue[800]!,
                                secondary: Colors.yellow[700]!,
                              ),
                            ),
                            child: child!,
                          ),
                        );
                        if (picked != null) setState(() => _selectedDate = picked);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_selectedDate == null ? 'Todas' : DateFormat('yyyy-MM-dd').format(_selectedDate!), style: TextStyle(color: Colors.blue[900])),
                          const Icon(Icons.calendar_today, color: Colors.blue),
                        ],
                      ),
                    ),
                  ),
                ),
                if (_selectedDate != null)
                  IconButton(
                    icon: const Icon(Icons.clear, color: Colors.yellow),
                    onPressed: () => setState(() => _selectedDate = null),
                  ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: _filteredAsistencias.isEmpty
                  ? Center(
                      child: Text(
                        'No hay registros para los filtros seleccionados.',
                        style: TextStyle(color: Colors.yellow[700], fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.separated(
                      itemCount: _filteredAsistencias.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, i) {
                        final a = _filteredAsistencias[i];
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow[100],
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.person, color: Colors.blue),
                            title: Text(
                              _getDocenteNombre(a.docenteDni),
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[900]),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('DNI:  [${a.docenteDni}', style: TextStyle(color: Colors.blue[700])),
                                Text('Fecha: ${DateFormat('yyyy-MM-dd').format(a.fechaHora)}', style: TextStyle(color: Colors.blue[700])),
                                Text('Hora: ${DateFormat('HH:mm').format(a.fechaHora)}', style: TextStyle(color: Colors.blue[700])),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _estadoIcono(a.estado),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  tooltip: 'Eliminar registro',
                                  onPressed: () async {
                                    final confirm = await showDialog<bool>(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Eliminar registro'),
                                        content: const Text('¿Estás seguro de que deseas eliminar este registro de asistencia?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context, false),
                                            child: const Text('Cancelar'),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.pop(context, true),
                                            child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
                                          ),
                                        ],
                                      ),
                                    );
                                    if (confirm == true) {
                                      final isar = await IsarService.isar;
                                      await isar.writeTxn(() async {
                                        await isar.asistencias.delete(a.id);
                                      });
                                      setState(() {
                                        _asistencias.removeWhere((asist) => asist.id == a.id);
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _estadoIcono(EstadoAsistencia estado) {
    switch (estado) {
      case EstadoAsistencia.aTiempo:
        return const Icon(Icons.check_circle, color: Colors.green, size: 32);
      case EstadoAsistencia.tarde:
        return const Icon(Icons.access_time, color: Colors.orange, size: 32);
      case EstadoAsistencia.ausente:
        return const Icon(Icons.cancel, color: Colors.red, size: 32);
    }
  }
}

