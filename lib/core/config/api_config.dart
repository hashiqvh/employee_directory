import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import '../errors/error.dart';

class ApiConfig {
  final Dio client;
  final Logger _log;

  ApiConfig({
    @required this.client,
    @required Logger logger,
  }) : _log = logger;

  Future<Either<Errors, dynamic>> getListData({
    @required String endpoint,
  }) async {
    log("started");
    Response response;

    try {
      response = await client.get(endpoint);

      return Right(response.data);
    } on DioError catch (dioerror) {
      var err = Errors.fromResponse(dioerror.response, dioerror.toString());
      _log.e(err);
      return Left(err);
    } catch (e) {
      var err = Errors.unknownError(
        "Oops something went wrong",
        stackTrace: e.toString(),
      );
      // _log.e(err);
      return Left(err);
    }
  }
}
