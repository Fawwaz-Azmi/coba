import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/controllers/picker_controller.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    controllerPicked controll = Get.put(controllerPicked());

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 28,
          ),
        ),
        backgroundColor: Colors.blueGrey.shade700,
        elevation: 0,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Obx(() {
                if (controll.img.value != null) {
                  return CircleAvatar(
                    radius: 64,
                    backgroundImage: FileImage(controll.img.value!),
                  );
                } else {
                  return CircleAvatar(
                    radius: 64,
                    backgroundImage: AssetImage('lib/app/data/Assets/akun.jpg'),
                  );
                }
              }),
              Positioned(
                child: IconButton(
                  onPressed: () {
                    controll.pickGallery();
                  },
                  icon: Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                  ),
                ),
                bottom: -12,
                left: 80,
              ),
            ],
          )
        ],
      )),
    );
  }
}
