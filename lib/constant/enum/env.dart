import 'package:dio/dio.dart';
import 'package:flutter_template/data/api/mock.dart';

/// Build Environment
enum Env {
  /// Mock Environment
  mock,

  /// Staging Environment
  stg,

  /// Production Environment
  prod,
}

extension EnvExtension on Env {
  /// Http Client
  Dio get dio {
    switch (this) {
      case Env.mock:
        return MockDio();
      case Env.stg:
        return Dio(
          BaseOptions(baseUrl: "https://acnhapi.com"),
        );
      case Env.prod:
        return Dio(
          BaseOptions(baseUrl: "PROD_BASE_URL_HERE"),
        );
    }
  }
}
