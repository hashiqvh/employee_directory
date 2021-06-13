import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

/// [Errors] is a common dataType to pass around errors
/// happening inside the app
class Errors extends Equatable {
  final String message;
  final int statusCode;
  final String error;
  final String stackTrace;
  final Logger _log = Logger();

  Errors({
    @required this.message,
    @required this.statusCode,
    @required this.error,
    @required this.stackTrace,
  }) {
    /// Logging the error messages
    _log.e(this.toString());
  }

  /// This factory method is used to convert an error occuring while
  /// calling an api -> convert it into a redable form
  factory Errors.fromResponse(Response response, String stackTrace) {
    return Errors(
      message: 'Oops something went wrong!!!',
      statusCode: response?.statusCode ?? 100,
      error: 'api_error',
      stackTrace: ''' 

          Status Message : ${response?.statusMessage}
          Data           : ${response.toString()}

          Error

          $stackTrace
      
      ''',
    );
  }

  /// This factory method is used to convert an error occuring while
  /// calling an api -> convert it into a redable form
  factory Errors.unknownError(String message, {String stackTrace}) {
    return Errors(
      message: message,
      statusCode: 100,
      error: 'unknown_error',
      stackTrace: stackTrace ?? '',
    );
  }

  /// This factory method is used to convert an error occuring while
  /// calling an api -> caused while trying to fetch location
  factory Errors.locationError() {
    return Errors(
      message: 'Cannot fetch location',
      statusCode: 100,
      error: 'location_error',
      stackTrace:
          'Location permission might be turned of ... turn it back on to continue',
    );
  }

  /// This factory method is used to convert an error occuring while
  /// calling an api -> caused due to no newtork connection
  factory Errors.networkError() {
    return Errors(
      message: 'Please check your internet connection',
      statusCode: 100,
      error: 'network_error',
      stackTrace: 'Turn your internet connection ON to continue',
    );
  }

  /// ToString method which responds with a pretty
  /// formated instance overview
  @override
  String toString() {
    return ''' 
    
    Error Occured with
    Message     : ${this.message}
    StatusCode  : ${this.statusCode}
    Error       : ${this.error}
    
    
    StackTrace  \n ${this.stackTrace}

    ''';
  }

  @override
  List<Object> get props => [
        message,
        error,
        statusCode,
        stackTrace,
      ];
}
