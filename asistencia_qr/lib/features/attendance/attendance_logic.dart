import 'package:intl/intl.dart';
import '../../data/isar_service.dart';
import '../../data/models/asistencia.dart';

class AttendanceLogic {
  // Define la hora límite de llegada (por ejemplo, 8:00 AM)
  static final DateTime horaLimite = DateFormat('HH:mm').parse('08:00');

  static Future<EstadoAsistencia> registrarAsistencia(String docenteDni) async {
    final now = DateTime.now();
    final estado = _determinarEstado(now);
    final isar = await IsarService.isar;
    await isar.writeTxn(() async {
      await isar.asistencias.put(
        Asistencia()
          ..docenteDni = docenteDni
          ..fechaHora = now
          ..estado = estado,
      );
    });
    return estado;
  }

  static EstadoAsistencia _determinarEstado(DateTime now) {
    final horaLlegada = DateFormat('HH:mm').format(now);
    final horaLimiteStr = DateFormat('HH:mm').format(DateTime(now.year, now.month, now.day, horaLimite.hour, horaLimite.minute));
    if (horaLlegada.compareTo(horaLimiteStr) <= 0) {
      return EstadoAsistencia.aTiempo;
    } else {
      return EstadoAsistencia.tarde;
    }
  }
} 