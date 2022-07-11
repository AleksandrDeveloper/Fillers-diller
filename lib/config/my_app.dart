import 'package:flutter/material.dart';

import 'configs.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _navigator = AppRoutes();
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color.fromRGBO(244, 244, 244, 1),
        ),
        initialRoute: _navigator.initialRoutes,
        routes: _navigator.routes);
  }
}
