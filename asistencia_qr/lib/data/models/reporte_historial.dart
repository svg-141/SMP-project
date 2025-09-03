import 'package:isar/isar.dart';

part 'reporte_historial.g.dart';

@collection
class ReporteHistorial {
  Id id = Isar.autoIncrement;

  late String nombreArchivo;
  
  late String rutaArchivo;
  
  late DateTime fechaCreacion;
  
  DateTime? fechaInicio;
  
  DateTime? fechaFin;
  
  late int totalRegistros;
  
  late String tipoReporte; // 'excel', 'pdf', etc.
}