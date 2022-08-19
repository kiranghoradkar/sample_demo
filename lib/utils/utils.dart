import 'package:connectivity_plus/connectivity_plus.dart';

abstract class Utils {
  static Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
