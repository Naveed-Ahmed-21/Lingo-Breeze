import 'dart:io';

class ApiConstants {
  // Use localhost for iOS simulator, 10.0.2.2 for Android emulator
  static String get baseUrl {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:3000';
    }
    return 'http://localhost:3000';
  }
}
