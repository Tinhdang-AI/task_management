import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: _buildBodyPage()),
    );
  }

  Widget _buildBodyPage() {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_buildIconSplash(), _buildTextSplash()],
        ),
      ),
    );
  }

  Widget _buildIconSplash() {
    return Image.asset(
      "assets/images/logo_school.png",
      width: 103,
      height: 70,
      fit: BoxFit.contain,
    );
  }

  Widget _buildTextSplash() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: const Text(
        'UTH SmartTasks',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF006EE9),
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
