// Cores
import 'package:connectivity/connectivity.dart';

class ConnectionService {
  static final ConnectionService _singleton = ConnectionService._internal();

  factory ConnectionService() {
    return _singleton;
  }

  ConnectionService._internal();

  final connectivity = Connectivity();

  Future<bool> isConnectNetwork() async =>
      await connectivity.checkConnectivity() != ConnectivityResult.none;
}
