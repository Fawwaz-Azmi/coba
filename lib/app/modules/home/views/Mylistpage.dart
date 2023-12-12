import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/controllers/Database_controller.dart';
import 'package:get/get.dart';

class MyListView extends StatelessWidget {
  final List<String> movieNames;
  final DatabaseController databaseController = Get.put(DatabaseController());

  MyListView(this.movieNames);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Mylist'),
      ),
      body: ListView.builder(
          itemCount: movieNames.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                databaseController.findDocId(movieNames[index]);
              },
              child: ListTile(
                title: Text(movieNames[index]),
                textColor: Colors.white,
              ),
            );
          }),
    );
  }
}
