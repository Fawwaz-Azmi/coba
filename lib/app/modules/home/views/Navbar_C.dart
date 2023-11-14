import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_application_1/app/modules/home/views/Category.dart';
import 'package:flutter_application_1/app/modules/home/views/home_view.dart';
import 'package:flutter_application_1/app/modules/home/views/testing.dart';
import 'package:get/get.dart';

class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 178, 42, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        InkWell(
          onTap: () {
            Get.to(() => HomeView());
          },
          child: Icon(
            Icons.home,
            color: Colors.white,
            size: 30,
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(() => Testing(data: homeController.dataFormat));
          },
          child: Icon(
            Icons.favorite,
            color: Colors.white,
            size: 30,
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(() => categoryView());
          },
          child: Icon(
            Icons.category,
            color: Colors.white,
            size: 30,
          ),
        ),
      ]),
    );
  }
}
