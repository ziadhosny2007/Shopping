import 'package:shopping/core/di/app_keys.dart';
import 'package:shopping/core/di/service_locator.dart';
import 'package:shopping/core/helper/app_secure_storage.dart';
import 'package:shopping/core/routes/routes.dart';

Future<String> initialRoute() async {
  final storage = serviceLocator<AppSecureStorage>();
  String token = await storage.read(AppKeys.token);
  if (token.isNotEmpty) {
    return Routes.appSection;
  } else {
    return Routes.login;
  }
}
