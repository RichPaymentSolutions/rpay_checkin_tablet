import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rp_checkin/routes/routes_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkin App',
      theme: ThemeData(
        useMaterial3: false,
      ),
      onGenerateRoute: RoutesManager.generateRoute,
      initialRoute: RouteNames.login,
    );
  }
}
