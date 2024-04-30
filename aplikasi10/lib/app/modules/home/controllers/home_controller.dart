//import-import yang di butuhkan
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  //inisilisasi Controller dan teman-temannya
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  RxMap<String, dynamic> userData = RxMap<String, dynamic>();
  late RxString name = "".obs;
  late RxString address = "".obs;
  late RxInt phoneNumber = 0.obs;
  late RxString email = "".obs;
  late RxString imageURL = "".obs;

  @override
  void onInit() {
    super.onInit();
    final username = Get.arguments['username'];
    if (username != null) {
      getUserData(username);
    }
  }

  //dapatin user datanya
  void getUserData(String username) async {
    try {
      var snapshot = await _firestore.collection('User').doc(username).get();
      if (snapshot.exists) {
        userData = RxMap<String, dynamic>.from(snapshot.data() ?? {});
        name.value = userData['name'];
        address.value = userData['address'];
        phoneNumber.value = userData['phoneNumber'];
        email.value = userData['email'];
        imageURL.value = userData['imageURL'];
      } else {
        //apabila tidak di temukan
        Get.snackbar(
          'Error',
          'Pengguna dengan username $username tidak ditemukan.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      //kesalahan yang mungkin terjadi
      Get.snackbar(
        'Error',
        'Tolong isi Profile anda',
        backgroundColor: Colors.yellow,
        colorText: Colors.white,
      );
    }
  }

  //logika kirim gambar
  Future<void> uploadImage(File image) async {
    try {
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference =
          _storage.ref().child('UserImages/$imageName');

      await storageReference.putFile(image);

      String downloadURL = await storageReference.getDownloadURL();

      DocumentReference userDocRef =
          _firestore.collection('User').doc(Get.arguments['username']);
      var userDocSnapshot = await userDocRef.get();
      if (!userDocSnapshot.exists) {
        await userDocRef.set({});
      }
      await userDocRef.update({
        'imageURL': downloadURL,
      });
      imageURL.value = downloadURL;
      //apabila sukses mengupload
      Get.snackbar(
        'Success',
        'Gambar berhasil diupdate',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      //kesalahan yang mungkin terjadi
      Get.snackbar(
        'Error',
        'Terjadi kesalahan saat mengunggah gambar: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  //logika ambil gambar
  Future<void> pickImage() async {
    try {
      //ambil gambar
      XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        File image = File(pickedFile.path);
        await uploadImage(image);
      }
    } catch (e) {
      //kesalahan yang mungkin terjadi
      Get.snackbar(
        'Error',
        'Terjadi Saat memilih gambar: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
