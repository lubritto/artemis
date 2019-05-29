import 'package:json_annotation/json_annotation.dart';

part 'graphql.g.dart';

// https://gist.github.com/craigbeck/b90915d49fda19d5b2b17ead14dcd6da
// https://github.com/graphql/graphql-js/blob/master/src/type/introspection.js

@JsonSerializable()
class GraphQLSchema {
  final List<GraphQLType> types;
  final GraphQLType queryType;
  final GraphQLType mutationType;
  final GraphQLType subscriptionType;
  final List<GraphQLDirective> directives;

  GraphQLSchema({
    List<GraphQLType> types,
    this.queryType,
    this.mutationType,
    this.subscriptionType,
    List<GraphQLDirective> directives,
  })  : types = types ?? <GraphQLType>[],
        directives = directives ?? <GraphQLDirective>[];

  factory GraphQLSchema.fromJson(Map<String, dynamic> json) =>
      _$GraphQLSchemaFromJson(json['data']['__schema']);

  Map<String, dynamic> toJson() => _$GraphQLSchemaToJson(this);
}

@JsonSerializable()
class GraphQLDirective {
  final String name;
  final String description;
  List<GraphQLDirectiveLocation> locations;
  List<GraphQLInputValue> args;

  GraphQLDirective({
    this.name,
    this.description,
    List<GraphQLInputValue> locations,
    List<GraphQLInputValue> args,
  })  : args = args ?? <GraphQLInputValue>[],
        locations = locations ?? <GraphQLDirectiveLocation>[];

  factory GraphQLDirective.fromJson(Map<String, dynamic> json) =>
      _$GraphQLDirectiveFromJson(json);

  Map<String, dynamic> toJson() => _$GraphQLDirectiveToJson(this);
}

enum GraphQLDirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
}

@JsonSerializable()
class GraphQLType {
  final GraphQLTypeKind kind;
  final String name;
  final String description;
  final List<GraphQLField> fields;
  final List<GraphQLType> interfaces;
  final List<GraphQLType> possibleTypes;
  final List<GraphQLEnumValue> enumValues;
  final List<GraphQLInputValue> inputFields;

  GraphQLType({
    this.kind,
    this.name,
    this.description,
    List<GraphQLField> fields,
    List<GraphQLType> interfaces,
    List<GraphQLType> possibleTypes,
    List<GraphQLEnumValue> enumValues,
    List<GraphQLInputValue> inputFields,
  })  : fields = fields ?? <GraphQLField>[],
        inputFields = inputFields ?? <GraphQLInputValue>[],
        interfaces = interfaces ?? <GraphQLType>[],
        enumValues = enumValues ?? <GraphQLEnumValue>[],
        possibleTypes = possibleTypes ?? <GraphQLType>[];

  factory GraphQLType.fromJson(Map<String, dynamic> json) =>
      _$GraphQLTypeFromJson(json);

  Map<String, dynamic> toJson() => _$GraphQLTypeToJson(this);
}

enum GraphQLTypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
}

@JsonSerializable()
class GraphQLField {
  final String name;
  final String description;
  final List<GraphQLInputValue> args;
  final GraphQLType type;
  final bool isDeprecated;
  final String deprecatedReason;

  GraphQLField({
    this.name,
    this.description,
    List<GraphQLInputValue> args,
    this.type,
    this.isDeprecated,
    this.deprecatedReason,
  }) : args = args ?? <GraphQLInputValue>[];

  factory GraphQLField.fromJson(Map<String, dynamic> json) =>
      _$GraphQLFieldFromJson(json);

  Map<String, dynamic> toJson() => _$GraphQLFieldToJson(this);
}

@JsonSerializable()
class GraphQLInputValue {
  final String name;
  final String description;
  final GraphQLType type;
  final String defaultValue;

  GraphQLInputValue({
    this.name,
    this.description,
    this.type,
    this.defaultValue,
  });

  factory GraphQLInputValue.fromJson(Map<String, dynamic> json) =>
      _$GraphQLInputValueFromJson(json);

  Map<String, dynamic> toJson() => _$GraphQLInputValueToJson(this);
}

@JsonSerializable()
class GraphQLEnumValue {
  final String name;
  final String description;
  final bool isDeprecated;
  final String deprecatedReason;

  GraphQLEnumValue({
    this.name,
    this.description,
    this.isDeprecated,
    this.deprecatedReason,
  });

  factory GraphQLEnumValue.fromJson(Map<String, dynamic> json) =>
      _$GraphQLEnumValueFromJson(json);

  Map<String, dynamic> toJson() => _$GraphQLEnumValueToJson(this);
}