import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _containerWidth = 200.0;
  double _containerHeight = 200.0;
  double _containerOpacity = 1.0;

  @override
  void initState() {
    super.initState();

    initAsync();
  }

  Future<void> initAsync() async {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _containerWidth = 500.0;
        _containerHeight = 500.0;
        _containerOpacity = 0.0;
      });

      Future.delayed(Duration(milliseconds: 50), () {
        _doOpenPage();
      });
    });
  }

  void _doOpenPage() {
    Navigator.of(context).pushReplacement<void, void>(
      MaterialPageRoute(
        builder: (BuildContext context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          opacity: _containerOpacity,
          duration: Duration(milliseconds: 500),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: _containerWidth,
            height: _containerHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
