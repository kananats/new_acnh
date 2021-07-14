import 'package:dio/dio.dart';
import 'package:flutter_template/constant/exception/http_exception.dart';
import 'package:flutter_template/util/locator.dart';

class Api {
  final dio = locator.get<Dio>();

  // GET Http Request

  // POST Http Request

  Future<dynamic> _execute(
    Future<Response<dynamic>> Function() handler,
  ) async {
    final Response<dynamic> response;

    try {
      response = await handler();
    } on DioError catch (_) {
      throw HttpException();
    }

    if (response.data == null) throw HttpException();

    return response.data;
  }
}
