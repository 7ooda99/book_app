import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure({
    required this.errMessage,
  });
}

class ServerFailure extends Failure{
  ServerFailure({required super.errMessage});




  factory ServerFailure.fromDioError(DioError dioError)
  {
    switch (dioError.type){
      
      case DioErrorType.connectionTimeout:
        return ServerFailure(errMessage: 'connection timeout with apiServer');

      case DioErrorType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout with apiServer');

      case DioErrorType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeout with apiServer');

      case DioErrorType.badCertificate:
        return ServerFailure(errMessage: 'connection timeout with apiServer');

      case DioErrorType.badResponse:
       return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);

      case DioErrorType.cancel:
        return ServerFailure(errMessage: 'Requst to apiServer was cancelled');

      case DioErrorType.connectionError:
       return ServerFailure(errMessage: 'No internent connection');

      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')){
          return ServerFailure(errMessage: "No internent connection");
        } return ServerFailure(errMessage: 'Unexcpected Error, please try again');
        
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response)
  {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403 )
    {
      return ServerFailure(errMessage: response['error']['message']);
    } else if (statusCode == 404)
    {
      return ServerFailure(errMessage: 'Your request not found, try again later');
    } else if (
      statusCode == 500
    )
    {
      return ServerFailure(errMessage: 'Internal server error, please try later');
    } else 
    {
      return ServerFailure(errMessage: 'Opps There was an error. please try later');
    }
  }
}