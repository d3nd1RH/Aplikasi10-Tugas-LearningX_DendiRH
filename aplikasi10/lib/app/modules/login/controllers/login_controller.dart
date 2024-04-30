//import-import yang di butuhkan
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //inisilasisi controller dan teman-teamnnya
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  //logika loginnya
  Future<void> login(String username, String password) async {
    //Notifikasi apabila kosong
    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter username and password',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    //mengambil data dari firebase
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('User')
          .where('username', isEqualTo: username)
          .get();
      //apabila ada isinya
      if (querySnapshot.docs.isNotEmpty) {
        final user = querySnapshot.docs.first.data();
        if (user['password'] == password) {
          Get.snackbar(
            'Success',
            'Login successful',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.offNamed('/home', arguments: {'username': username});
        } else {
          Get.snackbar(
            'Error',
            'Incorrect password',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        //kesalahan yang mungkin terjadi
        Get.snackbar('Error', 'User not found',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (error) {
      //kesalahan yang mungkin terjadi
      Get.snackbar(
        'Error',
        'Login failed: $error',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
