import 'package:chatify/pages/login_page.dart';
import 'package:chatify/providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//packages
// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:provider/provider.dart';

//services
import './services/navigation_service.dart';

//providers
// import './providers/authentication_provider.dart';

//pages
import 'package:chatify/pages/splash_page.dart';
// import 'package:chatify/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(
        key: UniqueKey(),
        onInitializationComplete: () {
          runApp(
            MainApp(),
          );
        },
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (BuildContext _context) {
            return AuthenticationProvider();
          },
        ),
      ],
      child: MaterialApp(
        title: 'Chatify',
        theme: ThemeData(
          backgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
          // colorScheme:
          //     ColorScheme.fromSeed(seedColor: Color.fromRGBO(36, 35, 49, 1.0)),
          scaffoldBackgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
          ),
        ),
        navigatorKey: NavigationService.navigatorKey,
        initialRoute: '/login',
        routes: {
          '/login': (BuildContext _context) => LoginPage(),
        },
      ),
    );
  }
}
