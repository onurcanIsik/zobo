import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zobo/core/utils/routers/app_router.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('okeyBox');
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRoute = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRoute.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
