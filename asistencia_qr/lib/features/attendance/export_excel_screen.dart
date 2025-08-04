import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import '../../data/isar_service.dart';
import '../../data/models/asistencia.dart';
import '../../data/models/docente.dart';
import 'package:intl/intl.dart';

class ExportExcelScreen extends StatefulWidget {
  const ExportExcelScreen({super.key});

  @override
  State<ExportExcelScreen> createState() => _ExportExcelScreenState();
}

class _ExportExcelScreenState extends State<ExportExcelScreen> {
  bool _exporting = false;
  String? _filePath;
  String? _error;

  DateTime? _startDate;
  DateTime? _endDate;
  String? _selectedDirectory;

  Future<void> _pickStartDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
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
    if (picked != null) {
      setState(() {
        _startDate = picked;
        if (_endDate != null && _endDate!.isBefore(_startDate!)) {
          _endDate = null; // reset end date if before start date
        }
      });
    }
  }

  Future<void> _pickEndDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? (_startDate ?? DateTime.now()),
      firstDate: _startDate ?? DateTime(2020),
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
    if (picked != null) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  Future<void> _pickDirectory() async {
    String? selectedDir = await FilePicker.platform.getDirectoryPath();
    if (selectedDir != null) {
      setState(() {
        _selectedDirectory = selectedDir;
      });
    }
  }

  Future<void> _exportToExcel() async {
    if (_startDate != null && _endDate != null && _endDate!.isBefore(_startDate!)) {
      setState(() {
        _error = 'La fecha final no puede ser anterior a la fecha inicial.';
      });
      return;
    }
    if (_selectedDirectory == null) {
      setState(() {
        _error = 'Por favor, selecciona una carpeta para guardar el archivo.';
      });
      return;
    }

    setState(() {
      _exporting = true;
      _filePath = null;
      _error = null;
    });
    try {
      final isar = await IsarService.isar;
      final asistencias = <Asistencia>[];
      final q = isar.asistencias.where();
      final allIds = await q.idProperty().findAll();
      for (final id in allIds) {
        final asistencia = await isar.asistencias.get(id);
        if (asistencia != null) {
          final fecha = asistencia.fechaHora;
          final afterStart = _startDate == null || !fecha.isBefore(_startDate!);
          final beforeEnd = _endDate == null || !fecha.isAfter(_endDate!);
          if (afterStart && beforeEnd) {
            asistencias.add(asistencia);
          }
        }
      }

      final docenteIds = List<int>.generate(1000, (i) => i + 1);
      final docentesRaw = await isar.docentes.getAll(docenteIds);
      final docentes = docentesRaw.whereType<Docente>().toList();

      final docenteMap = {for (var d in docentes) d.dni: d};
      final excel = Excel.createExcel();
      final sheet = excel['Asistencias'];
      sheet.updateCell(CellIndex.indexByString("A1"), CellValue('DNI'));
      sheet.updateCell(CellIndex.indexByString("B1"), CellValue('Nombre'));
      sheet.updateCell(CellIndex.indexByString("C1"), CellValue('Apellidos'));
      sheet.updateCell(CellIndex.indexByString("D1"), CellValue('Fecha'));
      sheet.updateCell(CellIndex.indexByString("E1"), CellValue('Hora'));
      sheet.updateCell(CellIndex.indexByString("F1"), CellValue('Estado'));
      int row = 2;
      for (final a in asistencias) {
        final docente = docenteMap[a.docenteDni];
        final nombre = docente?.nombre ?? '';
        final apellidos = docente?.apellidos ?? '';
        final fecha = DateFormat('yyyy-MM-dd').format(a.fechaHora);
        final hora = DateFormat('HH:mm').format(a.fechaHora);
        final estado = _estadoToString(a.estado);
        sheet.updateCell(CellIndex.indexByString("A\$row"), CellValue(a.docenteDni));
        sheet.updateCell(CellIndex.indexByString("B\$row"), CellValue(nombre));
        sheet.updateCell(CellIndex.indexByString("C\$row"), CellValue(apellidos));
        sheet.updateCell(CellIndex.indexByString("D\$row"), CellValue(fecha));
        sheet.updateCell(CellIndex.indexByString("E\$row"), CellValue(hora));
        sheet.updateCell(CellIndex.indexByString("F\$row"), CellValue(estado));
        row++;
      }
      final file = File('$_selectedDirectory/asistencias_exportadas.xlsx');
      await file.writeAsBytes(excel.encode()!);
      setState(() {
        _filePath = file.path;
      });
    } catch (e) {
      setState(() {
        _error = 'Error al exportar: $e';
      });
    } finally {
      setState(() {
        _exporting = false;
      });
    }
  }

  String _estadoToString(EstadoAsistencia estado) {
    switch (estado) {
      case EstadoAsistencia.aTiempo:
        return 'A tiempo';
      case EstadoAsistencia.tarde:
        return 'Tarde';
      case EstadoAsistencia.ausente:
        return 'Ausente';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exportar Asistencias a Excel'),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.yellow[700],
      ),
      backgroundColor: Colors.blue[800],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.file_download, size: 80, color: Colors.yellow[700]),
                const SizedBox(height: 24),
                const Text(
                  'Exporta registros de asistencia a un archivo Excel (.xlsx)',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Fecha inicio',
                          filled: true,
                          fillColor: Colors.yellow[100],
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: InkWell(
                          onTap: _pickStartDate,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _startDate == null ? 'Selecciona fecha' : DateFormat('yyyy-MM-dd').format(_startDate!),
                                style: TextStyle(color: Colors.blue[900]),
                              ),
                              const Icon(Icons.calendar_today, color: Colors.blue),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Fecha fin',
                          filled: true,
                          fillColor: Colors.yellow[100],
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: InkWell(
                          onTap: _pickEndDate,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _endDate == null ? 'Selecciona fecha' : DateFormat('yyyy-MM-dd').format(_endDate!),
                                style: TextStyle(color: Colors.blue[900]),
                              ),
                              const Icon(Icons.calendar_today, color: Colors.blue),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  icon: const Icon(Icons.folder_open),
                  label: const Text('Seleccionar carpeta para guardar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[700],
                    foregroundColor: Colors.blue[900],
                    minimumSize: const Size.fromHeight(48),
                  ),
                  onPressed: _pickDirectory,
                ),
                if (_selectedDirectory != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Carpeta seleccionada: $_selectedDirectory',
                      style: const TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  icon: const Icon(Icons.file_download),
                  label: const Text('Exportar a Excel'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[700],
                    foregroundColor: Colors.blue[900],
                    minimumSize: const Size.fromHeight(48),
                  ),
                  onPressed: _exporting ? null : _exportToExcel,
                ),
                const SizedBox(height: 24),
                if (_exporting)
                  const CircularProgressIndicator(color: Colors.yellow),
                if (_filePath != null)
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        'Archivo guardado en:',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        _filePath!,
                        style: const TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                if (_error != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(_error!, style: const TextStyle(color: Colors.red)),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
