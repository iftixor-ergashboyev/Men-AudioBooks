import 'package:flutter/material.dart';
import 'package:men/pages/splash_page.dart';

void main() {
  runApp(const Men());
}
class Men extends StatelessWidget {
  const Men({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      home: const SplashPage(),

    );
  }
}
