import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/controllers/client_controller.dart';
import 'package:flutter_application_1/app/modules/home/views/Mylistpage.dart';
import 'package:flutter_application_1/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

class DatabaseController extends ClientController {
  Databases? databases;
  @override
  void onInit() {
    super.onInit();
// appwrite
    databases = Databases(client);
  }

  Future storeUserName(Map map) async {
    try {
      final result = await databases!.createDocument(
        databaseId: "656695e9b6b6d7d42f86",
        documentId: ID.unique(),
        collectionId: "6566961aaf9313f8f671",
        data: map,
        permissions: [
          Permission.read(Role.user("656698fbe2b300e55d4f")),
          Permission.update(Role.user("656698fbe2b300e55d4f")),
          Permission.delete(Role.user("656698fbe2b300e55d4f")),
        ],
      );
      print("DatabaseController:: storeUserName $databases");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  Future addToFav(String movieName) async {
    try {
      final result = await databases!.createDocument(
          databaseId: "656695e9b6b6d7d42f86",
          collectionId: "656ab74b09da9a718075",
          documentId: ID.unique(),
          data: {"movie_name": movieName});
    } catch (e) {
      print(e);
    }
  }

  Future cheklist(String movieName) async {
    bool duplicate = false;
    try {
      final result = await databases!.listDocuments(
        databaseId: '656695e9b6b6d7d42f86',
        collectionId: '656ab74b09da9a718075',
      );

      for (var i = 0; i < result.total; i++) {
        if (result.documents[i].data['movie_name'] == movieName) {
          duplicate = true;
          print("duplicate");
          break;
        }
      }

      if (!duplicate) {
        addToFav(movieName);
      }
    } catch (e) {
      print(e);
    }
  }

  Future getList() async {
    try {
      final result = await databases!.listDocuments(
        databaseId: '656695e9b6b6d7d42f86',
        collectionId: '656ab74b09da9a718075',
      );
      // mengambil data dari dokumen yang tersimpan di appwrite
      List<String> movieNames = [];
      for (var i = 0; i < result.total; i++) {
        movieNames.add(result.documents[i].data['movie_name']);
      }
      print(result.documents[0].data);
      Get.to(() => MyListView(movieNames));
    } catch (e) {
      print(e);
    }
  }

  Future deleteDocument(String docId) async {
    try {
      final result = await databases!.deleteDocument(
        databaseId: '656695e9b6b6d7d42f86',
        collectionId: '656ab74b09da9a718075',
        documentId: docId,
      );

      Get.off(HomeView());
    } catch (e) {
      print(e);
    }
  }

  Future findDocId(String movieName) async {
    try {
      final result = await databases!.listDocuments(
        databaseId: '656695e9b6b6d7d42f86',
        collectionId: '656ab74b09da9a718075',
      );

      for (var i = 0; i < result.documents.length; i++) {
        if (result.documents[i].data['movie_name'] == movieName) {
          deleteDocument(result.documents[i].$id);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
