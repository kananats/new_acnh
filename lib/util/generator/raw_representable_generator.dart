// ignore_for_file: use_string_buffers
// ignore_for_file: implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:new_acnh/constant/annotation/raw_representable.dart';
import 'package:new_acnh/constant/annotation/raw_value.dart';
import 'package:source_gen/source_gen.dart';

class RawPresentableGenerator extends GeneratorForAnnotation<RawRepresentable> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final enumName = _enumName(element);
    final rawValueType = _rawValueType(annotation);
    final rawValueMap = _rawValueMap(element, enumName, rawValueType);

    return _generate(enumName, rawValueType, rawValueMap);
  }

  String _enumName(
    Element element,
  ) {
    if (element is! ClassElement || !element.isEnum)
      throw InvalidGenerationSourceError(
          "${element.displayName} is not an enum");

    return element.displayName;
  }

  String _rawValueType(
    ConstantReader annotation,
  ) {
    final typeString = annotation
        .read("type")
        .typeValue
        .getDisplayString(withNullability: false);

    switch (typeString) {
      case "String":
        return "String";
      case "int":
        return "int";
      default:
        throw InvalidGenerationSourceError(
            "RawRepresentable only supports String and int");
    }
  }

  Map<String, String> _rawValueMap(
    Element element,
    String enumName,
    String rawValueType,
  ) {
    if (element is! ClassElement) return {};

    final fields = element.fields.where(
      (element) => element.isEnumConstant,
    );

    final Map<String, String> map = {};

    var counter = 0;
    for (final field in fields) {
      String rawValue =
          rawValueType == "String" ? field.displayName : "$counter";

      final annotation =
          const TypeChecker.fromRuntime(RawValue).firstAnnotationOfExact(field);

      if (annotation != null) {
        final reader = ConstantReader(annotation);

        final literalValue = reader.read("rawValue").literalValue;
        if (literalValue == null)
          throw InvalidGenerationSourceError("RawValue cannot be null");
        if (literalValue.runtimeType.toString() != rawValueType)
          throw InvalidGenerationSourceError(
              "RawValue type must match with RawRepresentable");

        rawValue = literalValue.toString();
      }

      rawValue = rawValueType == "String" ? '"$rawValue"' : rawValue;

      if (map.containsValue(rawValue))
        throw InvalidGenerationSourceError("RawValue must be unique");

      map["$enumName.${field.displayName}"] = rawValue;

      counter += 1;
    }

    return map;
  }

  String _generate(
    String enumName,
    String rawValueType,
    Map<String, String> rawValueMap,
  ) {
    var getRawValueCases = "";
    for (final entry in rawValueMap.entries) {
      getRawValueCases += """
        case ${entry.key}: 
          return ${entry.value};
      """;
    }

    return """
      extension \$${enumName}Extension on $enumName {
        $rawValueType get rawValue {
          switch (this) {
            $getRawValueCases
          }
        }

        static $enumName? fromRawValue($rawValueType rawValue) {
          try {
            return $enumName.values.firstWhere(
              (element) => element.rawValue == rawValue,
            );
          } on StateError {
            return null;
          }
        }
      }
    """;
  }
}
