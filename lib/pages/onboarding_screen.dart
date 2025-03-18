import 'package:flutter/material.dart';
import 'package:task_management/pages/reminder_page.dart';
import 'package:task_management/pages/splash_page.dart';
import 'package:task_management/pages/time_management_page.dart';
import 'package:task_management/pages/work_effectiveness_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Widget> pages = [
    SplashPage(),
    TimeManagementPage(),
    WorkEffectivenessPage(),
    ReminderPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.white], // Gradient nền
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Quay lại màn hình trước
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                children: pages,
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: List.generate(
            //     pages.length,
            //         (index) => buildDot(index),
            //   ),
            // ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentIndex > 0)
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.blue, size: 28),
                      onPressed: () {
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      if (_currentIndex == pages.length - 1) {
                        Navigator.pop(context); // Kết thúc onboarding, quay lại
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      _currentIndex == pages.length - 1 ? 'Get Started' : 'Next',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget buildDot(int index) {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 5),
  //     width: _currentIndex == index ? 12 : 8,
  //     height: _currentIndex == index ? 12 : 8,
  //     decoration: BoxDecoration(
  //       color: _currentIndex == index ? Colors.blue : Colors.grey,
  //       shape: BoxShape.circle,
  //     ),
  //   );
  // }
}
