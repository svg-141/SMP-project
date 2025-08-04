import 'package:isar/isar.dart';

part 'asistencia.g.dart';

enum EstadoAsistencia { aTiempo, tarde, ausente }

@collection
class Asistencia {
  Id id = Isar.autoIncrement;

  late String docenteDni;
  late DateTime fechaHora;
  @enumerated
  late EstadoAsistencia estado;

  Asistencia();
} 