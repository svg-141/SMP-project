import 'package:isar/isar.dart';

part 'qr_registro.g.dart';

@collection
class QrRegistro {
  Id id = Isar.autoIncrement;

  late String docenteDni;
  late String qrData;
  late DateTime fechaCreacion;

  QrRegistro();
} 