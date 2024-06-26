import 'package:flutter/material.dart';
import 'package:movie_app1/home_page.dart';
import 'package:movie_app1/provider/pro_stack.dart';
import 'package:provider/provider.dart';
import 'package:movie_app1/shared.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await UserSimplePreferences().init();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderVM()),
      ],
      child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => const Home(),
          },
        ));
  }
}

