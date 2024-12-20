import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'ui/components/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const App());
}
