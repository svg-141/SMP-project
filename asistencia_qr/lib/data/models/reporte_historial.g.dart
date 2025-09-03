// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reporte_historial.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReporteHistorialCollection on Isar {
  IsarCollection<ReporteHistorial> get reporteHistorials => this.collection();
}

const ReporteHistorialSchema = CollectionSchema(
  name: r'ReporteHistorial',
  id: 6298375867020280886,
  properties: {
    r'fechaCreacion': PropertySchema(
      id: 0,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaFin': PropertySchema(
      id: 1,
      name: r'fechaFin',
      type: IsarType.dateTime,
    ),
    r'fechaInicio': PropertySchema(
      id: 2,
      name: r'fechaInicio',
      type: IsarType.dateTime,
    ),
    r'nombreArchivo': PropertySchema(
      id: 3,
      name: r'nombreArchivo',
      type: IsarType.string,
    ),
    r'rutaArchivo': PropertySchema(
      id: 4,
      name: r'rutaArchivo',
      type: IsarType.string,
    ),
    r'tipoReporte': PropertySchema(
      id: 5,
      name: r'tipoReporte',
      type: IsarType.string,
    ),
    r'totalRegistros': PropertySchema(
      id: 6,
      name: r'totalRegistros',
      type: IsarType.long,
    )
  },
  estimateSize: _reporteHistorialEstimateSize,
  serialize: _reporteHistorialSerialize,
  deserialize: _reporteHistorialDeserialize,
  deserializeProp: _reporteHistorialDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _reporteHistorialGetId,
  getLinks: _reporteHistorialGetLinks,
  attach: _reporteHistorialAttach,
  version: '3.1.0+1',
);

int _reporteHistorialEstimateSize(
  ReporteHistorial object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.nombreArchivo.length * 3;
  bytesCount += 3 + object.rutaArchivo.length * 3;
  bytesCount += 3 + object.tipoReporte.length * 3;
  return bytesCount;
}

void _reporteHistorialSerialize(
  ReporteHistorial object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.fechaCreacion);
  writer.writeDateTime(offsets[1], object.fechaFin);
  writer.writeDateTime(offsets[2], object.fechaInicio);
  writer.writeString(offsets[3], object.nombreArchivo);
  writer.writeString(offsets[4], object.rutaArchivo);
  writer.writeString(offsets[5], object.tipoReporte);
  writer.writeLong(offsets[6], object.totalRegistros);
}

ReporteHistorial _reporteHistorialDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReporteHistorial();
  object.fechaCreacion = reader.readDateTime(offsets[0]);
  object.fechaFin = reader.readDateTimeOrNull(offsets[1]);
  object.fechaInicio = reader.readDateTimeOrNull(offsets[2]);
  object.id = id;
  object.nombreArchivo = reader.readString(offsets[3]);
  object.rutaArchivo = reader.readString(offsets[4]);
  object.tipoReporte = reader.readString(offsets[5]);
  object.totalRegistros = reader.readLong(offsets[6]);
  return object;
}

P _reporteHistorialDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _reporteHistorialGetId(ReporteHistorial object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _reporteHistorialGetLinks(ReporteHistorial object) {
  return [];
}

void _reporteHistorialAttach(
    IsarCollection<dynamic> col, Id id, ReporteHistorial object) {
  object.id = id;
}

extension ReporteHistorialQueryWhereSort
    on QueryBuilder<ReporteHistorial, ReporteHistorial, QWhere> {
  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ReporteHistorialQueryWhere
    on QueryBuilder<ReporteHistorial, ReporteHistorial, QWhereClause> {
  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ReporteHistorialQueryFilter
    on QueryBuilder<ReporteHistorial, ReporteHistorial, QFilterCondition> {
  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      fechaCreacionGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      fechaCreacionLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      fechaCreacionBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaCreacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      fechaFinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaFin',
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      fechaFinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaFin',
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      fechaFinEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaFin',
        value: value,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      fechaFinGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaFin',
        value: value,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      fechaFinLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaFin',
        value: value,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      fechaFinBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaFin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      fechaInicioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaInicio',
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      fechaInicioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaInicio',
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      fechaInicioEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      fechaInicioGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      fechaInicioLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      fechaInicioBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaInicio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      nombreArchivoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreArchivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      nombreArchivoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombreArchivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      nombreArchivoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombreArchivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      nombreArchivoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombreArchivo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      nombreArchivoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombreArchivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      nombreArchivoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombreArchivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      nombreArchivoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombreArchivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      nombreArchivoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombreArchivo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      nombreArchivoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreArchivo',
        value: '',
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      nombreArchivoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombreArchivo',
        value: '',
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      rutaArchivoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rutaArchivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      rutaArchivoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rutaArchivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      rutaArchivoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rutaArchivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      rutaArchivoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rutaArchivo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      rutaArchivoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rutaArchivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      rutaArchivoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rutaArchivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      rutaArchivoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rutaArchivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      rutaArchivoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rutaArchivo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      rutaArchivoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rutaArchivo',
        value: '',
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      rutaArchivoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rutaArchivo',
        value: '',
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      tipoReporteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoReporte',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      tipoReporteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipoReporte',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      tipoReporteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipoReporte',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      tipoReporteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipoReporte',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      tipoReporteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipoReporte',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      tipoReporteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipoReporte',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      tipoReporteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipoReporte',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      tipoReporteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipoReporte',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      tipoReporteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoReporte',
        value: '',
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      tipoReporteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipoReporte',
        value: '',
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      totalRegistrosEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalRegistros',
        value: value,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      totalRegistrosGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalRegistros',
        value: value,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      totalRegistrosLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalRegistros',
        value: value,
      ));
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterFilterCondition>
      totalRegistrosBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalRegistros',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ReporteHistorialQueryObject
    on QueryBuilder<ReporteHistorial, ReporteHistorial, QFilterCondition> {}

extension ReporteHistorialQueryLinks
    on QueryBuilder<ReporteHistorial, ReporteHistorial, QFilterCondition> {}

extension ReporteHistorialQuerySortBy
    on QueryBuilder<ReporteHistorial, ReporteHistorial, QSortBy> {
  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      sortByFechaFin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.asc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      sortByFechaFinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.desc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      sortByFechaInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.asc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      sortByFechaInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.desc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      sortByNombreArchivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreArchivo', Sort.asc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      sortByNombreArchivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreArchivo', Sort.desc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      sortByRutaArchivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rutaArchivo', Sort.asc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      sortByRutaArchivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rutaArchivo', Sort.desc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      sortByTipoReporte() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoReporte', Sort.asc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      sortByTipoReporteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoReporte', Sort.desc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      sortByTotalRegistros() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRegistros', Sort.asc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      sortByTotalRegistrosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRegistros', Sort.desc);
    });
  }
}

extension ReporteHistorialQuerySortThenBy
    on QueryBuilder<ReporteHistorial, ReporteHistorial, QSortThenBy> {
  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      thenByFechaFin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.asc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      thenByFechaFinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.desc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      thenByFechaInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.asc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      thenByFechaInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.desc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      thenByNombreArchivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreArchivo', Sort.asc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      thenByNombreArchivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreArchivo', Sort.desc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      thenByRutaArchivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rutaArchivo', Sort.asc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      thenByRutaArchivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rutaArchivo', Sort.desc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      thenByTipoReporte() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoReporte', Sort.asc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      thenByTipoReporteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoReporte', Sort.desc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      thenByTotalRegistros() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRegistros', Sort.asc);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QAfterSortBy>
      thenByTotalRegistrosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRegistros', Sort.desc);
    });
  }
}

extension ReporteHistorialQueryWhereDistinct
    on QueryBuilder<ReporteHistorial, ReporteHistorial, QDistinct> {
  QueryBuilder<ReporteHistorial, ReporteHistorial, QDistinct>
      distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QDistinct>
      distinctByFechaFin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaFin');
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QDistinct>
      distinctByFechaInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaInicio');
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QDistinct>
      distinctByNombreArchivo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombreArchivo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QDistinct>
      distinctByRutaArchivo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rutaArchivo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QDistinct>
      distinctByTipoReporte({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipoReporte', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReporteHistorial, ReporteHistorial, QDistinct>
      distinctByTotalRegistros() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalRegistros');
    });
  }
}

extension ReporteHistorialQueryProperty
    on QueryBuilder<ReporteHistorial, ReporteHistorial, QQueryProperty> {
  QueryBuilder<ReporteHistorial, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReporteHistorial, DateTime, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<ReporteHistorial, DateTime?, QQueryOperations>
      fechaFinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaFin');
    });
  }

  QueryBuilder<ReporteHistorial, DateTime?, QQueryOperations>
      fechaInicioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaInicio');
    });
  }

  QueryBuilder<ReporteHistorial, String, QQueryOperations>
      nombreArchivoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombreArchivo');
    });
  }

  QueryBuilder<ReporteHistorial, String, QQueryOperations>
      rutaArchivoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rutaArchivo');
    });
  }

  QueryBuilder<ReporteHistorial, String, QQueryOperations>
      tipoReporteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipoReporte');
    });
  }

  QueryBuilder<ReporteHistorial, int, QQueryOperations>
      totalRegistrosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalRegistros');
    });
  }
}
