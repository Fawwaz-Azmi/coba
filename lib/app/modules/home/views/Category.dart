import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/views/Navbar_C.dart';

class categoryView extends StatelessWidget {
  const categoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      // appBar: AppBar(),
    );
  }
}
