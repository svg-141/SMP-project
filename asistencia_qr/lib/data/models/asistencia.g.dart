// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asistencia.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAsistenciaCollection on Isar {
  IsarCollection<Asistencia> get asistencias => this.collection();
}

const AsistenciaSchema = CollectionSchema(
  name: r'Asistencia',
  id: 1992313975347730603,
  properties: {
    r'docenteDni': PropertySchema(
      id: 0,
      name: r'docenteDni',
      type: IsarType.string,
    ),
    r'estado': PropertySchema(
      id: 1,
      name: r'estado',
      type: IsarType.byte,
      enumMap: _AsistenciaestadoEnumValueMap,
    ),
    r'fechaHora': PropertySchema(
      id: 2,
      name: r'fechaHora',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _asistenciaEstimateSize,
  serialize: _asistenciaSerialize,
  deserialize: _asistenciaDeserialize,
  deserializeProp: _asistenciaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _asistenciaGetId,
  getLinks: _asistenciaGetLinks,
  attach: _asistenciaAttach,
  version: '3.1.0+1',
);

int _asistenciaEstimateSize(
  Asistencia object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.docenteDni.length * 3;
  return bytesCount;
}

void _asistenciaSerialize(
  Asistencia object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.docenteDni);
  writer.writeByte(offsets[1], object.estado.index);
  writer.writeDateTime(offsets[2], object.fechaHora);
}

Asistencia _asistenciaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Asistencia();
  object.docenteDni = reader.readString(offsets[0]);
  object.estado =
      _AsistenciaestadoValueEnumMap[reader.readByteOrNull(offsets[1])] ??
          EstadoAsistencia.aTiempo;
  object.fechaHora = reader.readDateTime(offsets[2]);
  object.id = id;
  return object;
}

P _asistenciaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (_AsistenciaestadoValueEnumMap[reader.readByteOrNull(offset)] ??
          EstadoAsistencia.aTiempo) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AsistenciaestadoEnumValueMap = {
  'aTiempo': 0,
  'tarde': 1,
  'ausente': 2,
};
const _AsistenciaestadoValueEnumMap = {
  0: EstadoAsistencia.aTiempo,
  1: EstadoAsistencia.tarde,
  2: EstadoAsistencia.ausente,
};

Id _asistenciaGetId(Asistencia object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _asistenciaGetLinks(Asistencia object) {
  return [];
}

void _asistenciaAttach(IsarCollection<dynamic> col, Id id, Asistencia object) {
  object.id = id;
}

extension AsistenciaQueryWhereSort
    on QueryBuilder<Asistencia, Asistencia, QWhere> {
  QueryBuilder<Asistencia, Asistencia, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AsistenciaQueryWhere
    on QueryBuilder<Asistencia, Asistencia, QWhereClause> {
  QueryBuilder<Asistencia, Asistencia, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Asistencia, Asistencia, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterWhereClause> idBetween(
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

extension AsistenciaQueryFilter
    on QueryBuilder<Asistencia, Asistencia, QFilterCondition> {
  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition> docenteDniEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'docenteDni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition>
      docenteDniGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'docenteDni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition>
      docenteDniLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'docenteDni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition> docenteDniBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'docenteDni',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition>
      docenteDniStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'docenteDni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition>
      docenteDniEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'docenteDni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition>
      docenteDniContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'docenteDni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition> docenteDniMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'docenteDni',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition>
      docenteDniIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'docenteDni',
        value: '',
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition>
      docenteDniIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'docenteDni',
        value: '',
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition> estadoEqualTo(
      EstadoAsistencia value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: value,
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition> estadoGreaterThan(
    EstadoAsistencia value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estado',
        value: value,
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition> estadoLessThan(
    EstadoAsistencia value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estado',
        value: value,
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition> estadoBetween(
    EstadoAsistencia lower,
    EstadoAsistencia upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition> fechaHoraEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaHora',
        value: value,
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition>
      fechaHoraGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaHora',
        value: value,
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition> fechaHoraLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaHora',
        value: value,
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition> fechaHoraBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaHora',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Asistencia, Asistencia, QAfterFilterCondition> idBetween(
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
}

extension AsistenciaQueryObject
    on QueryBuilder<Asistencia, Asistencia, QFilterCondition> {}

extension AsistenciaQueryLinks
    on QueryBuilder<Asistencia, Asistencia, QFilterCondition> {}

extension AsistenciaQuerySortBy
    on QueryBuilder<Asistencia, Asistencia, QSortBy> {
  QueryBuilder<Asistencia, Asistencia, QAfterSortBy> sortByDocenteDni() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'docenteDni', Sort.asc);
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterSortBy> sortByDocenteDniDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'docenteDni', Sort.desc);
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterSortBy> sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterSortBy> sortByFechaHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaHora', Sort.asc);
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterSortBy> sortByFechaHoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaHora', Sort.desc);
    });
  }
}

extension AsistenciaQuerySortThenBy
    on QueryBuilder<Asistencia, Asistencia, QSortThenBy> {
  QueryBuilder<Asistencia, Asistencia, QAfterSortBy> thenByDocenteDni() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'docenteDni', Sort.asc);
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterSortBy> thenByDocenteDniDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'docenteDni', Sort.desc);
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterSortBy> thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterSortBy> thenByFechaHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaHora', Sort.asc);
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterSortBy> thenByFechaHoraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaHora', Sort.desc);
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Asistencia, Asistencia, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension AsistenciaQueryWhereDistinct
    on QueryBuilder<Asistencia, Asistencia, QDistinct> {
  QueryBuilder<Asistencia, Asistencia, QDistinct> distinctByDocenteDni(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'docenteDni', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Asistencia, Asistencia, QDistinct> distinctByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado');
    });
  }

  QueryBuilder<Asistencia, Asistencia, QDistinct> distinctByFechaHora() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaHora');
    });
  }
}

extension AsistenciaQueryProperty
    on QueryBuilder<Asistencia, Asistencia, QQueryProperty> {
  QueryBuilder<Asistencia, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Asistencia, String, QQueryOperations> docenteDniProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'docenteDni');
    });
  }

  QueryBuilder<Asistencia, EstadoAsistencia, QQueryOperations>
      estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<Asistencia, DateTime, QQueryOperations> fechaHoraProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaHora');
    });
  }
}
