import 'package:isar/isar.dart';

part 'docente.g.dart';

@collection
class Docente {
  Id get isarId => fastHash(dni); // Hash del DNI como ID interno

  @Index(unique: true)
  late String dni;
  late String nombre;
  late String apellidos;
  String? qrData; // Puede ser el string codificado del QR

  Docente();
}

int fastHash(String s) {
  return s.codeUnits.fold(0, (prev, elem) => prev * 31 + elem);
} 