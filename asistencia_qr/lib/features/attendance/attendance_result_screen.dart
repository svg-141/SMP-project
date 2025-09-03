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
      appBar: AppBar(
        title: const Text('Resultado de Asistencia'),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.yellow[700],
      ),
      backgroundColor: Colors.blue[800],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: success
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.yellow[700],
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.yellow.withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.blue[900],
                        size: 64,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.yellow[50],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            '¡Asistencia Registrada Exitosamente!',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          if (docenteNombre != null) ...[
                            _InfoRow(
                              icon: Icons.person,
                              label: 'Docente',
                              value: docenteNombre!,
                            ),
                            const SizedBox(height: 12),
                          ],
                          if (docenteDni != null) ...[
                            _InfoRow(
                              icon: Icons.badge,
                              label: 'DNI',
                              value: docenteDni!,
                            ),
                            const SizedBox(height: 12),
                          ],
                          if (estado != null) ...[
                            _InfoRow(
                              icon: _getEstadoIcon(estado!),
                              label: 'Estado',
                              value: _estadoToString(estado!),
                              valueColor: _getEstadoColor(estado!),
                            ),
                            const SizedBox(height: 12),
                          ],
                          if (fechaHora != null)
                            _InfoRow(
                              icon: Icons.access_time,
                              label: 'Fecha y Hora',
                              value: '${fechaHora!.day.toString().padLeft(2, '0')}/${fechaHora!.month.toString().padLeft(2, '0')}/${fechaHora!.year} - ${fechaHora!.hour.toString().padLeft(2, '0')}:${fechaHora!.minute.toString().padLeft(2, '0')}',
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.home),
                      label: const Text('Volver al Inicio'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[700],
                        foregroundColor: Colors.blue[900],
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.error,
                        color: Colors.red[700],
                        size: 64,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Error al Registrar Asistencia',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.red[800],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            message ?? 'Ocurrió un error inesperado. Por favor, inténtalo de nuevo.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red[700],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.home),
                      label: const Text('Volver al Inicio'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[700],
                        foregroundColor: Colors.blue[900],
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                    ),
                  ],
                ),
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

  IconData _getEstadoIcon(EstadoAsistencia estado) {
    switch (estado) {
      case EstadoAsistencia.aTiempo:
        return Icons.check_circle;
      case EstadoAsistencia.tarde:
        return Icons.access_time;
      case EstadoAsistencia.ausente:
        return Icons.cancel;
    }
  }

  Color _getEstadoColor(EstadoAsistencia estado) {
    switch (estado) {
      case EstadoAsistencia.aTiempo:
        return Colors.green;
      case EstadoAsistencia.tarde:
        return Colors.orange;
      case EstadoAsistencia.ausente:
        return Colors.red;
    }
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Colors.blue[700],
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: valueColor ?? Colors.blue[900],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 