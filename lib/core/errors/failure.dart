import 'package:dio/dio.dart';

abstract class failure {
  final String errormessage;

  failure(this.errormessage);
}

class serverfailure extends failure {
  serverfailure(super.errormessage);
  factory serverfailure.fromdioerror(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return serverfailure("Connection time out");
      case DioExceptionType.sendTimeout:
        return serverfailure("send time out");
      case DioExceptionType.receiveTimeout:
        return serverfailure("recieve time out");
      case DioExceptionType.badCertificate:
        return serverfailure("Connection time out");
      case DioExceptionType.badResponse:
        return serverfailure(dioException.response!.data["message"]);
      case DioExceptionType.cancel:
        return serverfailure("Connection time out");
      case DioExceptionType.connectionError:
        return serverfailure("Connection time out");
      case DioExceptionType.unknown:
        return serverfailure("Connection time out");
      default:
        return serverfailure("there was an error");
    }
  }
}
