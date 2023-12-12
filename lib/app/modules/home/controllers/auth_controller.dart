import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/controllers/Account_controller.dart';
import 'package:flutter_application_1/app/modules/home/views/Login_page.dart';
import 'package:flutter_application_1/app/modules/home/views/choise.dart';
import 'package:flutter_application_1/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  RxString name = ''.obs;
  RxString email = ''.obs;

  final AccountController _accountController = Get.put(AccountController());

  Future<void> registerAppwrite(
      String email, String password, String name) async {
    try {
      isLoading.value = true;
      await _accountController.createAccount({
        'userId': ID.unique(),
        'email': email,
        'password': password,
        'name': name,
      });
      this.name.value = name;
      this.email.value = email;

      Get.snackbar('Success', 'Registration successful',
          backgroundColor: Colors.green);
      Get.off(LoginPage()); //Navigate ke Login Page
    } catch (error) {
      Get.snackbar('Error', 'Registration failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginUserAppWrite(String email, String password) async {
    try {
      isLoading.value = true;
      await _accountController.createEmailSession(email, password);
      Get.snackbar('Succes', 'Login scucces', backgroundColor: Colors.green);
      Get.off(HomeView());
    } catch (err) {
      Get.snackbar('Error', 'Login failed: $err', backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> registerUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar('Success', 'Registration successful',
          backgroundColor: Colors.green);
      Get.off(LoginPage()); //Navigate ke Login Page
    } catch (error) {
      Get.snackbar('Error', 'Registration failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar('Succes', 'Login scucces', backgroundColor: Colors.green);
      Get.off(HomeView());
    } catch (err) {
      Get.snackbar('Error', 'Login failed: $err', backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  void logout() async {
    await _auth.signOut();
    Get.offAll(Choise());
  }
}
