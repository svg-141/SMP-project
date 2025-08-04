import 'package:flutter/material.dart';
import '../../data/models/asistencia.dart';

class AttendanceResultScreen extends StatelessWidget {
  final bool success;
  final String? docenteNombre;
  final String? docenteDni;
  final EstadoAsistencia? estado;
  final DateTime? fechaHora;
  final String? message;

  const AttendanceResultScreen({
    super.key,
    required this.success,
    this.docenteNombre,
    this.docenteDni,
    this.estado,
    this.fechaHora,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resultado de Asistencia')),
      body: Center(
        child: success
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 80),
                  const SizedBox(height: 16),
                  const Text('¡Asistencia registrada!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  if (docenteNombre != null) Text('Docente: $docenteNombre', style: const TextStyle(fontSize: 18)),
                  if (docenteDni != null) Text('DNI: $docenteDni', style: const TextStyle(fontSize: 18)),
                  if (estado != null) Text('Estado: ${_estadoToString(estado!)}', style: const TextStyle(fontSize: 18)),
                  if (fechaHora != null) Text('Hora: ${fechaHora!.toLocal().toString().substring(0, 19)}', style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                    child: const Text('Volver al inicio'),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 80),
                  const SizedBox(height: 16),
                  Text(message ?? 'Error al registrar asistencia', style: const TextStyle(fontSize: 20, color: Colors.red)),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                    child: const Text('Volver al inicio'),
                  ),
                ],
              ),
      ),
    );
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
} 