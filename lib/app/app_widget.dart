import 'package:flutter/material.dart';

import './pages/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moteis GO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Color(0xFFD21521),
          secondary: Color(0xFFB8000C),
          onPrimary: Colors.white,
          inversePrimary: Colors.black87,
        ),
        useMaterial3: false,
      ),
      home: const SplashPage(),
    );
  }
}
