import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/views/Login_page.dart';
import 'package:flutter_application_1/app/modules/home/views/RegisterPage.dart';
import 'package:get/get.dart';

class Choise extends StatelessWidget {
  const Choise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => LoginPage());
                print('Login button pressed');
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20), // Spasi antara tombol
            ElevatedButton(
              onPressed: () {
                Get.to(() => RegisterPage());
                print('Register button pressed');
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
