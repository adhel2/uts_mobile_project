import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/login_screen.dart';
import 'screens/list_screen.dart';
import 'screens/detail_screen.dart';
import 'models/item_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'UTS Mobile App',
      routerConfig: _router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/list',
        builder: (context, state) => ListScreen(),
      ),
      GoRoute(
        path: '/detail',
        builder: (context, state) {
          final item = state.extra as ItemModel?;
          return DetailScreen(item: item);
        },
      ),
    ],
  );
}
