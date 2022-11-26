import 'package:dio/dio.dart';

abstract class HttpMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
}

class HttpManager {
  Future<Map?> restRequest(
      {required String uri,
      required String method,
      Map<dynamic, dynamic>? headers,
      Map<dynamic, dynamic>? body}) async {
    // Headers da requisição
    final defaultHeader = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'X-Parse-Application-Id': 'g1Oui3JqxnY4S1ykpQWHwEKGOe0dRYCPvPF4iykc',
        'X-Parse-REST-API-Key': 'rFBKU8tk0m5ZlKES2CGieOaoYz6TgKxVMv8jRIsN',
      });

    Dio dio = Dio();
    try {
      Response response = await dio.request(
        uri,
        options: Options(
          method: method,
          headers: defaultHeader,
        ),
        data: body,
      );

      // Retorno do resultado do backend
      return response.data;

      // Retorno do resultado do error do DIO
    } on DioError catch (error) {
      error.response?.data ?? {};

      // Retorno do Map vazio para error genarizado
    } catch (error) {
      return {};
    }
    return null;
  }
}
