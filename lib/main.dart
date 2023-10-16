import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rp_checkin/routes/routes_manager.dart';
import 'package:rp_checkin/services/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.inject();
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
      initialRoute: RouteNames.chooseService,
    );
  }
}
