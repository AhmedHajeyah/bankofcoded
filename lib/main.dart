import 'package:bankofcoded/pages/main_page.dart';
import 'package:bankofcoded/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'pages/details_page.dart';
import 'providers/auth_providers.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProviders>(create: (_) => AuthProviders()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => SignUpPage(),
      ),
    ],
  );
}
