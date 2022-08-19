import 'package:connectivity_plus/connectivity_plus.dart';

/// This class is for to check internet connection
abstract class Utils {
  static Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
