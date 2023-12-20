import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfoImpl {
  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();

  Future<bool> get isConnected => connectionChecker.hasConnection;
}
