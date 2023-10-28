import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rp_checkin/routes/routes_manager.dart';
import 'package:rp_checkin/screens/app/app_provider.dart';
import 'package:rp_checkin/services/di/di.dart';
import 'package:rp_checkin/services/shared_manager/shared_manager.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await DependencyInjection.inject();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkin App',
      theme: ThemeData(
        useMaterial3: false,
      ),
      onGenerateRoute: RoutesManager.generateRoute,
      initialRoute:
          injector.get<SharedManager>().getString(SharedKey.accessToken.name) ==
                  null
              ? RouteNames.login
              : RouteNames.fillPhone,
    );
  }
}
