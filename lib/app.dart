import 'package:flutter/material.dart';
import 'package:skywatch/pages/welcome/welcome_view.dart';

class SkyWatch extends StatelessWidget {
  const SkyWatch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFFf6622d),
        hintColor: const Color(0xFF1e2a40),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      home: const WelcomeView(),
    );
  }
}
