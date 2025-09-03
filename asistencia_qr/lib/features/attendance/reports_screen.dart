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
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.yellow[50],
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.filter_list, color: Colors.blue[800], size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Filtros de Búsqueda',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: _selectedDni,
                        decoration: InputDecoration(
                          labelText: 'Seleccionar Docente',
                          prefixIcon: Icon(Icons.person, color: Colors.blue[700]),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.blue.shade200),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.blue.shade200),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.blue.shade600, width: 2),
                          ),
                        ),
                        items: [
                          const DropdownMenuItem(value: null, child: Text('Todos los docentes')),
                          ..._docentes.map((d) => DropdownMenuItem(
                                value: d.dni,
                                child: Text('${d.nombre} (${d.dni})'),
                              )),
                        ],
                        onChanged: (value) => setState(() => _selectedDni = value),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.blue.shade200),
                              ),
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  labelText: 'Fecha de Consulta',
                                  prefixIcon: Icon(Icons.calendar_today, color: Colors.blue[700]),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                                      Expanded(
                                        child: Text(
                                          _selectedDate == null 
                                              ? 'Todas las fechas' 
                                              : DateFormat('dd/MM/yyyy').format(_selectedDate!),
                                          style: TextStyle(
                                            color: Colors.blue[900],
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Icon(Icons.arrow_drop_down, color: Colors.blue[600]),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (_selectedDate != null) ...[
                            const SizedBox(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.red.shade50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.clear, color: Colors.red.shade600, size: 20),
                                onPressed: () => setState(() => _selectedDate = null),
                                tooltip: 'Limpiar filtro de fecha',
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ],
              ),
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
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            border: Border.all(
                              color: Colors.blue.shade100,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade50,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(Icons.person, color: Colors.blue[700], size: 24),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _getDocenteNombre(a.docenteDni),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900],
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: Text(
                                              'DNI: ${a.docenteDni}',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          _estadoIcono(a.estado),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Icon(Icons.calendar_today, size: 14, color: Colors.grey[600]),
                                          const SizedBox(width: 4),
                                          Text(
                                            DateFormat('dd/MM/yyyy').format(a.fechaHora),
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 13,
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
                                          const SizedBox(width: 4),
                                          Text(
                                            DateFormat('HH:mm').format(a.fechaHora),
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade50,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.delete_outline, color: Colors.red.shade600, size: 20),
                                    tooltip: 'Eliminar registro',
                                    onPressed: () async {
                                      final confirm = await showDialog<bool>(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          title: Row(
                                            children: [
                                              Icon(Icons.warning_amber_rounded, color: Colors.orange.shade600),
                                              const SizedBox(width: 8),
                                              const Text('Eliminar registro'),
                                            ],
                                          ),
                                          content: const Text(
                                            '¿Estás seguro de que deseas eliminar este registro de asistencia? Esta acción no se puede deshacer.',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(context, false),
                                              child: Text(
                                                'Cancelar',
                                                style: TextStyle(color: Colors.grey[600]),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () => Navigator.pop(context, true),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                foregroundColor: Colors.white,
                                              ),
                                              child: const Text('Eliminar'),
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
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green.shade200),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.green.shade600, size: 14),
              const SizedBox(width: 4),
              Text(
                'A tiempo',
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      case EstadoAsistencia.tarde:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.orange.shade200),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.access_time, color: Colors.orange.shade600, size: 14),
              const SizedBox(width: 4),
              Text(
                'Tarde',
                style: TextStyle(
                  color: Colors.orange.shade700,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      case EstadoAsistencia.ausente:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.red.shade200),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.cancel, color: Colors.red.shade600, size: 14),
              const SizedBox(width: 4),
              Text(
                'Ausente',
                style: TextStyle(
                  color: Colors.red.shade700,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
    }
  }
}

