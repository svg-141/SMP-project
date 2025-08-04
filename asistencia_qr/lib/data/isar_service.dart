import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'models/docente.dart';
import 'models/asistencia.dart';
import 'models/qr_registro.dart';

class IsarService {
  static Isar? _isar;

  static Future<Isar> get isar async {
    if (_isar != null) return _isar!;
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [DocenteSchema, AsistenciaSchema, QrRegistroSchema],
      directory: dir.path,
    );
    return _isar!;
  }
} 