//import-import yang di butuhkan
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  //insialisasi controller dan teman-temannya
  final formKey = GlobalKey<FormState>();
  CollectionReference ref = FirebaseFirestore.instance.collection('User');
  late TextEditingController usernameController = TextEditingController();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController addressController = TextEditingController();
  late TextEditingController phoneNumberController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmPasswordController =
      TextEditingController();

  //cek apabila ada username yang sama
  Future<bool> checkUsernameExists(String username) async {
    final result = await ref.where('username', isEqualTo: username).get();
    return result.docs.isNotEmpty;
  }

  //cek apabila ada email yang sama
  Future<bool> checkEmailExists(String email) async {
    final result = await ref.where('email', isEqualTo: email).get();
    return result.docs.isNotEmpty;
  }

  //logika registernya
  Future<void> register(
    String username,
    String name,
    String email,
    String address,
    int phoneNumber,
    String password,
  ) async {
    if (formKey.currentState!.validate() &&
        email.isEmail &&
        password == confirmPasswordController.text) {
      try {
        //apabila username sama
        final usernameExists = await checkUsernameExists(username);
        if (usernameExists) {
          Get.snackbar(
            'Error',
            'Username already taken',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          return;
        }

        //apabila email sama
        final emailExists = await checkEmailExists(email);
        if (emailExists) {
          Get.snackbar(
            'Error',
            'Email already registered',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          return;
        }
        //apabila berhasil registrasi
        final refDoc = ref.doc(username);
        final user = {
          "username": username,
          "name": name,
          "email": email,
          "address": address,
          "phoneNumber": phoneNumber,
          "password": password,
        };
        refDoc.set(user);
        Get.snackbar(
          'Success',
          'Registration successful',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offNamed('/login');
      } catch (error) {
        //kesalahan lainnya yang mungkin terjadi
        if (error is FirebaseException) {
          if (error.code == 'email-already-in-use') {
            Get.snackbar(
              'Error',
              'Email already registered',
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          } else {
            Get.snackbar(
              'Error',
              'Registration failed: ${error.message}',
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        } else {
          Get.snackbar(
            'Error',
            'Registration failed: $error',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
    } else if (password != confirmPasswordController.text) {
      //apabila pass confirmnya tidak sama
      Get.snackbar(
        'Not success',
        'Password does not match',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      //apabila tidak mengisinya dengan benar
      Get.snackbar(
        'Not success',
        'Please fill all fields correctly',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  //dispose ketika selesai di gunakan
  @override
  void onClose() {
    usernameController.dispose();
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
