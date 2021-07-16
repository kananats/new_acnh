import 'package:dio/dio.dart';
import 'package:flutter_template/constant/exception/http_exception.dart';
import 'package:flutter_template/data/api/response/fish_response.dart';
import 'package:flutter_template/util/locator.dart';

class Api {
  final dio = locator.get<Dio>();

  // GET Http Request

  Future<List<FishResponse>> getV1Fish() async {
    final response = await _execute(() async {
      return await dio.get("/v1/fish");
    }) as Map<String, dynamic>;

    return response.values.map((e) {
      return FishResponse.fromJson(e as Map<String, dynamic>);
    }).toList();
  }

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
