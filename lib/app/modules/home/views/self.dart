import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/controllers/picker_controller.dart';
import 'package:flutter_application_1/app/modules/home/views/Edit_Profile.dart';
import 'package:flutter_application_1/app/modules/home/views/pageWeb.dart';
import 'package:get/get.dart';

class self extends StatelessWidget {
  const self({super.key});

  @override
  Widget build(BuildContext context) {
    controllerPicked controll = Get.put(controllerPicked());
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Fawwaz Azmi'),
            accountEmail: Text('fawwazazmi@gmail.com'),
            currentAccountPicture: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfile(),
                    ));
              },
              child: CircleAvatar(child: Obx(() {
                if (controll.img.value != null) {
                  return ClipOval(
                      child: Image.file(
                    controll.img.value!,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ));
                } else {
                  return ClipOval(
                      child: Image.asset(
                    "lib/app/data/Assets/akun.jpg",
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ));
                }
              })),
            ),
            decoration: BoxDecoration(color: Colors.blueGrey.shade700),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorite'),
            onTap: () => print('Fav'),
          ),
          ListTile(
            leading: Icon(Icons.bookmark),
            title: Text('Bookmark'),
            onTap: () => print('Bmark'),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
            onTap: () => print('Notif'),
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => print('Share'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () => print('Set'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () => print('Lout'),
          ),
          ListTile(
            leading: Icon(Icons.help_outline_sharp),
            title: Text('Help'),
            onTap: () => print('Help'),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WebViewContainer()));
            },
            child: ListTile(
              leading: Icon(Icons.web_sharp),
              title: Text('Halaman Web'),
            ),
          )
        ],
      ),
    );
  }
}
