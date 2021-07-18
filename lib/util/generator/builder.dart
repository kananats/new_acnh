import 'package:build/build.dart';
import 'package:new_acnh/util/generator/raw_representable_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder builder(BuilderOptions options) {
  return SharedPartBuilder(
    [RawPresentableGenerator()],
    "raw_representable_generator",
  );
}
