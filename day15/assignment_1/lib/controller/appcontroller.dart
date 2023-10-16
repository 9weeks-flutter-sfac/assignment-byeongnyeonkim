import 'package:get/get.dart';

class Appcontroller extends GetxController {
  String appVersion;
  String appName;
  String appAuthor;
  String appPackageName;
  bool isSound;
  bool isNotificationOn;
  DateTime? lastUpdated;
  Appcontroller(
      {required this.appAuthor,
      required this.appName,
      required this.appVersion,
      required this.lastUpdated,
      required this.appPackageName,
      required this.isSound,
      required this.isNotificationOn});
}
