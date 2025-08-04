import 'package:isar/isar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'isar_service.dart';
import 'models/docente.dart';
import 'models/asistencia.dart';
import 'models/qr_registro.dart';

class SupabaseSyncService {
  static final _client = Supabase.instance.client;

  // DOCENTES
  static Future<void> syncDocentesToSupabase() async {
    final isar = await IsarService.isar;
    final docentes = await isar.docentes.where().findAll();
    for (final docente in docentes) {
      await _client.from('docentes').upsert({
        'dni': docente.dni,
        'nombre': docente.nombre,
        'apellidos': docente.apellidos,
        'qr_data': docente.qrData,
      });
    }
  }

  static Future<void> syncDocentesFromSupabase() async {
    final isar = await IsarService.isar;
    final response = await _client.from('docentes').select().execute();
    final data = response.data as List<dynamic>;
    await isar.writeTxn(() async {
      for (final d in data) {
        await isar.docentes.put(
          Docente()
            ..dni = d['dni']
            ..nombre = d['nombre']
            ..apellidos = d['apellidos']
            ..qrData = d['qr_data'],
        );
      }
    });
  }

  // ASISTENCIAS
  static Future<void> syncAsistenciasToSupabase() async {
    final isar = await IsarService.isar;
    final asistencias = await isar.asistencias.where().findAll();
    for (final asistencia in asistencias) {
      await _client.from('asistencias').upsert({
        'docente_dni': asistencia.docenteDni,
        'fecha_hora': asistencia.fechaHora.toIso8601String(),
        'estado': asistencia.estado.index,
      });
    }
  }

  static Future<void> syncAsistenciasFromSupabase() async {
    final isar = await IsarService.isar;
    final response = await _client.from('asistencias').select().execute();
    final data = response.data as List<dynamic>;
    await isar.writeTxn(() async {
      for (final a in data) {
        await isar.asistencias.put(
          Asistencia()
            ..docenteDni = a['docente_dni']
            ..fechaHora = DateTime.parse(a['fecha_hora'])
            ..estado = EstadoAsistencia.values[a['estado']],
        );
      }
    });
  }

  // QR
  static Future<void> syncQrsToSupabase() async {
    final isar = await IsarService.isar;
    final qrs = await isar.qrRegistros.where().findAll();
    for (final qr in qrs) {
      await _client.from('qr_registros').upsert({
        'docente_dni': qr.docenteDni,
        'qr_data': qr.qrData,
        'fecha_creacion': qr.fechaCreacion.toIso8601String(),
      });
    }
  }

  static Future<void> syncQrsFromSupabase() async {
    final isar = await IsarService.isar;
    // ignore: deprecated_member_use
    final response = await _client.from('qr_registros').select().execute();
    final data = response.data as List<dynamic>;
    await isar.writeTxn(() async {
      for (final qr in data) {
        await isar.qrRegistros.put(
          QrRegistro()
            ..docenteDni = qr['docente_dni']
            ..qrData = qr['qr_data']
            ..fechaCreacion = DateTime.parse(qr['fecha_creacion']),
        );
      }
    });
  }
} 