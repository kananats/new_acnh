import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class MockDio extends DioForNative {
  MockDio() : super() {
    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          await Future.delayed(const Duration(milliseconds: 500));

          handler.resolve(
            Response<dynamic>(
              data: options.method == "GET"
                  ? _createGetResponse(options)
                  : _createPostResponse(options),
              requestOptions: options,
            ),
          );
        },
      ),
    );
  }

  Map<String, dynamic> _createGetResponse(RequestOptions options) {
    switch (options.path) {
      default:
        throw UnimplementedError("MockDio: GET ${options.path} is not defined");
    }
  }

  Map<String, dynamic> _createPostResponse(RequestOptions options) {
    switch (options.path) {
      default:
        throw UnimplementedError(
            "MockDio: POST ${options.path} is not defined");
    }
  }
}
