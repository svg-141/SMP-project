import 'package:isar/isar.dart';

import '../../data/isar_service.dart';
import '../../data/models/qr_registro.dart';

class QrStorage {
  static Future<void> guardarQr(String docenteDni, String qrData) async {
    final isar = await IsarService.isar;
    await isar.writeTxn(() async {
      await isar.qrRegistros.put(
        QrRegistro()
          ..docenteDni = docenteDni
          ..qrData = qrData
          ..fechaCreacion = DateTime.now(),
      );
    });
  }

  static Future<List<QrRegistro>> obtenerQrsDocente(String docenteDni) async {
    final isar = await IsarService.isar;
    return await isar.qrRegistros.filter().docenteDniEqualTo(docenteDni).findAll();
  }
} 