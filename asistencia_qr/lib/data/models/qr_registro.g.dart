// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_registro.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQrRegistroCollection on Isar {
  IsarCollection<QrRegistro> get qrRegistros => this.collection();
}

const QrRegistroSchema = CollectionSchema(
  name: r'QrRegistro',
  id: 1545306750922113688,
  properties: {
    r'docenteDni': PropertySchema(
      id: 0,
      name: r'docenteDni',
      type: IsarType.string,
    ),
    r'fechaCreacion': PropertySchema(
      id: 1,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'qrData': PropertySchema(
      id: 2,
      name: r'qrData',
      type: IsarType.string,
    )
  },
  estimateSize: _qrRegistroEstimateSize,
  serialize: _qrRegistroSerialize,
  deserialize: _qrRegistroDeserialize,
  deserializeProp: _qrRegistroDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _qrRegistroGetId,
  getLinks: _qrRegistroGetLinks,
  attach: _qrRegistroAttach,
  version: '3.1.0+1',
);

int _qrRegistroEstimateSize(
  QrRegistro object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.docenteDni.length * 3;
  bytesCount += 3 + object.qrData.length * 3;
  return bytesCount;
}

void _qrRegistroSerialize(
  QrRegistro object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.docenteDni);
  writer.writeDateTime(offsets[1], object.fechaCreacion);
  writer.writeString(offsets[2], object.qrData);
}

QrRegistro _qrRegistroDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QrRegistro();
  object.docenteDni = reader.readString(offsets[0]);
  object.fechaCreacion = reader.readDateTime(offsets[1]);
  object.id = id;
  object.qrData = reader.readString(offsets[2]);
  return object;
}

P _qrRegistroDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _qrRegistroGetId(QrRegistro object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _qrRegistroGetLinks(QrRegistro object) {
  return [];
}

void _qrRegistroAttach(IsarCollection<dynamic> col, Id id, QrRegistro object) {
  object.id = id;
}

extension QrRegistroQueryWhereSort
    on QueryBuilder<QrRegistro, QrRegistro, QWhere> {
  QueryBuilder<QrRegistro, QrRegistro, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QrRegistroQueryWhere
    on QueryBuilder<QrRegistro, QrRegistro, QWhereClause> {
  QueryBuilder<QrRegistro, QrRegistro, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<QrRegistro, QrRegistro, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterWhereClause> idBetween(
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

extension QrRegistroQueryFilter
    on QueryBuilder<QrRegistro, QrRegistro, QFilterCondition> {
  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition> docenteDniEqualTo(
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

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition>
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

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition>
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

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition> docenteDniBetween(
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

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition>
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

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition>
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

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition>
      docenteDniContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'docenteDni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition> docenteDniMatches(
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

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition>
      docenteDniIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'docenteDni',
        value: '',
      ));
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition>
      docenteDniIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'docenteDni',
        value: '',
      ));
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition>
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

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition>
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

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition>
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

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition> idBetween(
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

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition> qrDataEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qrData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition> qrDataGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qrData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition> qrDataLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qrData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition> qrDataBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qrData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition> qrDataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'qrData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition> qrDataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'qrData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition> qrDataContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'qrData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition> qrDataMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'qrData',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition> qrDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qrData',
        value: '',
      ));
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterFilterCondition>
      qrDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'qrData',
        value: '',
      ));
    });
  }
}

extension QrRegistroQueryObject
    on QueryBuilder<QrRegistro, QrRegistro, QFilterCondition> {}

extension QrRegistroQueryLinks
    on QueryBuilder<QrRegistro, QrRegistro, QFilterCondition> {}

extension QrRegistroQuerySortBy
    on QueryBuilder<QrRegistro, QrRegistro, QSortBy> {
  QueryBuilder<QrRegistro, QrRegistro, QAfterSortBy> sortByDocenteDni() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'docenteDni', Sort.asc);
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterSortBy> sortByDocenteDniDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'docenteDni', Sort.desc);
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterSortBy> sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterSortBy> sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterSortBy> sortByQrData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrData', Sort.asc);
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterSortBy> sortByQrDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrData', Sort.desc);
    });
  }
}

extension QrRegistroQuerySortThenBy
    on QueryBuilder<QrRegistro, QrRegistro, QSortThenBy> {
  QueryBuilder<QrRegistro, QrRegistro, QAfterSortBy> thenByDocenteDni() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'docenteDni', Sort.asc);
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterSortBy> thenByDocenteDniDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'docenteDni', Sort.desc);
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterSortBy> thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterSortBy> thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterSortBy> thenByQrData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrData', Sort.asc);
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QAfterSortBy> thenByQrDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrData', Sort.desc);
    });
  }
}

extension QrRegistroQueryWhereDistinct
    on QueryBuilder<QrRegistro, QrRegistro, QDistinct> {
  QueryBuilder<QrRegistro, QrRegistro, QDistinct> distinctByDocenteDni(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'docenteDni', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QDistinct> distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<QrRegistro, QrRegistro, QDistinct> distinctByQrData(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qrData', caseSensitive: caseSensitive);
    });
  }
}

extension QrRegistroQueryProperty
    on QueryBuilder<QrRegistro, QrRegistro, QQueryProperty> {
  QueryBuilder<QrRegistro, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QrRegistro, String, QQueryOperations> docenteDniProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'docenteDni');
    });
  }

  QueryBuilder<QrRegistro, DateTime, QQueryOperations> fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<QrRegistro, String, QQueryOperations> qrDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qrData');
    });
  }
}
