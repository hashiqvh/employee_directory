import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';

abstract class NetworkConfig {
  // Checks the current status of internet connection
  Future<bool> get isConnected;
}

class NetworkConfigImpl extends NetworkConfig {
  final DataConnectionChecker dataConnectionChecker;

  NetworkConfigImpl({
    @required this.dataConnectionChecker,
  });

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
