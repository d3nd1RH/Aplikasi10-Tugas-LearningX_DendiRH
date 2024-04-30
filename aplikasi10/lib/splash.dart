//import-import yang di butuhkan
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengatur preferensi orientasi potret
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //dellay nya 3 detik
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed('/login');
    });
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            //gambar Backgound
            image: AssetImage('assets/images/Backgound Splash.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //gambar Bunganya
              Image.asset(
                'assets/images/Flower.png',
                width: 200.w,
                height: 200.h,
              ),
              //teks besar
              Text(
                'HELLO FELLAS',
                style: TextStyle(
                  fontSize: 34.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //teks kecil
              Text(
                'Temukan segala jenis bunga\ndari berbagai belahan dunia!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
