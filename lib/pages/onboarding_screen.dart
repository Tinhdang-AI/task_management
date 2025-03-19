import 'package:flutter/material.dart';
import 'package:task_management/pages/reminder_page.dart'; // Import trang nhắc nhở
import 'package:task_management/pages/splash_page.dart'; // Import trang splash
import 'package:task_management/pages/time_management_page.dart'; // Import trang quản lý thời gian
import 'package:task_management/pages/work_effectiveness_page.dart'; // Import trang hiệu suất làm việc

// Lớp StatefulWidget để hiển thị màn hình onboarding
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController(); // Bộ điều khiển PageView để điều hướng giữa các trang
  int _currentIndex = 0; // Chỉ mục của trang hiện tại

  // Danh sách các trang trong onboarding
  final List<Widget> pages = [
    SplashPage(), // Trang Splash
    TimeManagementPage(), // Trang quản lý thời gian
    WorkEffectivenessPage(), // Trang hiệu suất làm việc
    ReminderPage(), // Trang nhắc nhở
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.white], // Gradient nền từ xanh sang trắng
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller, // Liên kết với bộ điều khiển để chuyển trang
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index; // Cập nhật chỉ mục khi thay đổi trang
                  });
                },
                children: pages, // Các trang onboarding được hiển thị trong PageView
              ),
            ),
            SizedBox(height: 20), // Đẩy nút lên cao hơn
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Khoảng cách lề của thanh điều hướng
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn chỉnh nút điều hướng
                children: [
                  if (_currentIndex > 0) // Chỉ hiển thị nút "Back" nếu không ở trang đầu tiên
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), // Định dạng nút hình tròn
                        padding: EdgeInsets.all(20), // Khoảng cách padding để tạo hình tròn
                        backgroundColor: Colors.blue, // Màu nền xanh dương
                      ),
                      onPressed: () {
                        _controller.previousPage(
                          duration: Duration(milliseconds: 500), // Thời gian animation khi quay lại trang trước
                          curve: Curves.easeInOut, // Hiệu ứng chuyển động
                        );
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white), // Icon quay lại màu trắng
                    ),
                  Spacer(), // Tạo khoảng trống giữa nút "Back" và nút "Next"/"Get Started"
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Màu nền xanh dương
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 14), // Kích thước nút lớn hơn
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), // Bo góc nút
                    ),
                    onPressed: () {
                      if (_currentIndex == pages.length - 1) { // Nếu đang ở trang cuối cùng
                        Navigator.pop(context); // Đóng màn hình onboarding
                      } else {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 500), // Thời gian animation khi chuyển trang
                          curve: Curves.easeInOut, // Hiệu ứng chuyển động
                        );
                      }
                    },
                    child: Text(
                      _currentIndex == pages.length - 1 ? 'Get Started' : 'Next', // Hiển thị "Get Started" nếu ở trang cuối, ngược lại là "Next"
                      style: TextStyle(color: Colors.white, fontSize: 16), // Định dạng chữ trên nút
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
}
