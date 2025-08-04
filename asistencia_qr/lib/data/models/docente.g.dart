// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'docente.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDocenteCollection on Isar {
  IsarCollection<Docente> get docentes => this.collection();
}

const DocenteSchema = CollectionSchema(
  name: r'Docente',
  id: 2021718194342232673,
  properties: {
    r'apellidos': PropertySchema(
      id: 0,
      name: r'apellidos',
      type: IsarType.string,
    ),
    r'dni': PropertySchema(
      id: 1,
      name: r'dni',
      type: IsarType.string,
    ),
    r'nombre': PropertySchema(
      id: 2,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'qrData': PropertySchema(
      id: 3,
      name: r'qrData',
      type: IsarType.string,
    )
  },
  estimateSize: _docenteEstimateSize,
  serialize: _docenteSerialize,
  deserialize: _docenteDeserialize,
  deserializeProp: _docenteDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'dni': IndexSchema(
      id: 7716107859896601784,
      name: r'dni',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'dni',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _docenteGetId,
  getLinks: _docenteGetLinks,
  attach: _docenteAttach,
  version: '3.1.0+1',
);

int _docenteEstimateSize(
  Docente object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.apellidos.length * 3;
  bytesCount += 3 + object.dni.length * 3;
  bytesCount += 3 + object.nombre.length * 3;
  {
    final value = object.qrData;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _docenteSerialize(
  Docente object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.apellidos);
  writer.writeString(offsets[1], object.dni);
  writer.writeString(offsets[2], object.nombre);
  writer.writeString(offsets[3], object.qrData);
}

Docente _docenteDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Docente();
  object.apellidos = reader.readString(offsets[0]);
  object.dni = reader.readString(offsets[1]);
  object.nombre = reader.readString(offsets[2]);
  object.qrData = reader.readStringOrNull(offsets[3]);
  return object;
}

P _docenteDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _docenteGetId(Docente object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _docenteGetLinks(Docente object) {
  return [];
}

void _docenteAttach(IsarCollection<dynamic> col, Id id, Docente object) {}

extension DocenteByIndex on IsarCollection<Docente> {
  Future<Docente?> getByDni(String dni) {
    return getByIndex(r'dni', [dni]);
  }

  Docente? getByDniSync(String dni) {
    return getByIndexSync(r'dni', [dni]);
  }

  Future<bool> deleteByDni(String dni) {
    return deleteByIndex(r'dni', [dni]);
  }

  bool deleteByDniSync(String dni) {
    return deleteByIndexSync(r'dni', [dni]);
  }

  Future<List<Docente?>> getAllByDni(List<String> dniValues) {
    final values = dniValues.map((e) => [e]).toList();
    return getAllByIndex(r'dni', values);
  }

  List<Docente?> getAllByDniSync(List<String> dniValues) {
    final values = dniValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'dni', values);
  }

  Future<int> deleteAllByDni(List<String> dniValues) {
    final values = dniValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'dni', values);
  }

  int deleteAllByDniSync(List<String> dniValues) {
    final values = dniValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'dni', values);
  }

  Future<Id> putByDni(Docente object) {
    return putByIndex(r'dni', object);
  }

  Id putByDniSync(Docente object, {bool saveLinks = true}) {
    return putByIndexSync(r'dni', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDni(List<Docente> objects) {
    return putAllByIndex(r'dni', objects);
  }

  List<Id> putAllByDniSync(List<Docente> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'dni', objects, saveLinks: saveLinks);
  }
}

extension DocenteQueryWhereSort on QueryBuilder<Docente, Docente, QWhere> {
  QueryBuilder<Docente, Docente, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DocenteQueryWhere on QueryBuilder<Docente, Docente, QWhereClause> {
  QueryBuilder<Docente, Docente, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Docente, Docente, QAfterWhereClause> isarIdGreaterThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<Docente, Docente, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Docente, Docente, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterWhereClause> dniEqualTo(String dni) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'dni',
        value: [dni],
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterWhereClause> dniNotEqualTo(String dni) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dni',
              lower: [],
              upper: [dni],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dni',
              lower: [dni],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dni',
              lower: [dni],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dni',
              lower: [],
              upper: [dni],
              includeUpper: false,
            ));
      }
    });
  }
}

extension DocenteQueryFilter
    on QueryBuilder<Docente, Docente, QFilterCondition> {
  QueryBuilder<Docente, Docente, QAfterFilterCondition> apellidosEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apellidos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> apellidosGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apellidos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> apellidosLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apellidos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> apellidosBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apellidos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> apellidosStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'apellidos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> apellidosEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'apellidos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> apellidosContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'apellidos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> apellidosMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'apellidos',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> apellidosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apellidos',
        value: '',
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> apellidosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'apellidos',
        value: '',
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> dniEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> dniGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> dniLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> dniBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dni',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> dniStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> dniEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> dniContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> dniMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dni',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> dniIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dni',
        value: '',
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> dniIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dni',
        value: '',
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> nombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> nombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> nombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> nombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> nombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> nombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> nombreContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> nombreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> qrDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qrData',
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> qrDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qrData',
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> qrDataEqualTo(
    String? value, {
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

  QueryBuilder<Docente, Docente, QAfterFilterCondition> qrDataGreaterThan(
    String? value, {
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

  QueryBuilder<Docente, Docente, QAfterFilterCondition> qrDataLessThan(
    String? value, {
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

  QueryBuilder<Docente, Docente, QAfterFilterCondition> qrDataBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<Docente, Docente, QAfterFilterCondition> qrDataStartsWith(
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

  QueryBuilder<Docente, Docente, QAfterFilterCondition> qrDataEndsWith(
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

  QueryBuilder<Docente, Docente, QAfterFilterCondition> qrDataContains(
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

  QueryBuilder<Docente, Docente, QAfterFilterCondition> qrDataMatches(
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

  QueryBuilder<Docente, Docente, QAfterFilterCondition> qrDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qrData',
        value: '',
      ));
    });
  }

  QueryBuilder<Docente, Docente, QAfterFilterCondition> qrDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'qrData',
        value: '',
      ));
    });
  }
}

extension DocenteQueryObject
    on QueryBuilder<Docente, Docente, QFilterCondition> {}

extension DocenteQueryLinks
    on QueryBuilder<Docente, Docente, QFilterCondition> {}

extension DocenteQuerySortBy on QueryBuilder<Docente, Docente, QSortBy> {
  QueryBuilder<Docente, Docente, QAfterSortBy> sortByApellidos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apellidos', Sort.asc);
    });
  }

  QueryBuilder<Docente, Docente, QAfterSortBy> sortByApellidosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apellidos', Sort.desc);
    });
  }

  QueryBuilder<Docente, Docente, QAfterSortBy> sortByDni() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dni', Sort.asc);
    });
  }

  QueryBuilder<Docente, Docente, QAfterSortBy> sortByDniDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dni', Sort.desc);
    });
  }

  QueryBuilder<Docente, Docente, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Docente, Docente, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Docente, Docente, QAfterSortBy> sortByQrData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrData', Sort.asc);
    });
  }

  QueryBuilder<Docente, Docente, QAfterSortBy> sortByQrDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrData', Sort.desc);
    });
  }
}

extension DocenteQuerySortThenBy
    on QueryBuilder<Docente, Docente, QSortThenBy> {
  QueryBuilder<Docente, Docente, QAfterSortBy> thenByApellidos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apellidos', Sort.asc);
    });
  }

  QueryBuilder<Docente, Docente, QAfterSortBy> thenByApellidosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apellidos', Sort.desc);
    });
  }

  QueryBuilder<Docente, Docente, QAfterSortBy> thenByDni() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dni', Sort.asc);
    });
  }

  QueryBuilder<Docente, Docente, QAfterSortBy> thenByDniDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dni', Sort.desc);
    });
  }

  QueryBuilder<Docente, Docente, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<Docente, Docente, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<Docente, Docente, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Docente, Docente, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Docente, Docente, QAfterSortBy> thenByQrData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrData', Sort.asc);
    });
  }

  QueryBuilder<Docente, Docente, QAfterSortBy> thenByQrDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrData', Sort.desc);
    });
  }
}

extension DocenteQueryWhereDistinct
    on QueryBuilder<Docente, Docente, QDistinct> {
  QueryBuilder<Docente, Docente, QDistinct> distinctByApellidos(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apellidos', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Docente, Docente, QDistinct> distinctByDni(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dni', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Docente, Docente, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Docente, Docente, QDistinct> distinctByQrData(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qrData', caseSensitive: caseSensitive);
    });
  }
}

extension DocenteQueryProperty
    on QueryBuilder<Docente, Docente, QQueryProperty> {
  QueryBuilder<Docente, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<Docente, String, QQueryOperations> apellidosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apellidos');
    });
  }

  QueryBuilder<Docente, String, QQueryOperations> dniProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dni');
    });
  }

  QueryBuilder<Docente, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<Docente, String?, QQueryOperations> qrDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qrData');
    });
  }
}
