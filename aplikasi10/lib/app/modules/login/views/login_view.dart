//import-import yang di butuhkan
//sizeBox dan Padding di sini berguna untuk pembatas
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengatur preferensi orientasi potret
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            //gambar backgound
            image: AssetImage('assets/images/Backgound Login & Register.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //gambar besar di tengah atas
                  Image.asset(
                    'assets/images/Login.png',
                    width: 200.w,
                    height: 200.h,
                  ),
                  SizedBox(height: 20.h),
                  //teks penyambutan
                  Text(
                    'Welcome To Azalea',
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: 300.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //teks sebelum TextFormField
                        Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        //TextFormFieldnya
                        TextFormField(
                          controller: controller.usernameController,
                          decoration: InputDecoration(
                            hintText: 'Username here...',
                            hintStyle: const TextStyle(
                                color: Color.fromRGBO(212, 212, 212, 1)),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(212, 212, 212, 1)),
                            ),
                          ),
                          //validasi apabila kosong
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Username';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
                        //teks sebelum TextFormField
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        //TextFormFieldnya
                        TextFormField(
                          controller: controller.passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password here...',
                            hintStyle: const TextStyle(
                                color: Color.fromRGBO(212, 212, 212, 1)),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.5),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(212, 212, 212, 1)),
                            ),
                          ),
                          //validasi apabila kosong
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: double.infinity,
                          //cek login dan hal lainnya
                          child: ElevatedButton(
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.login(
                                  controller.usernameController.text,
                                  controller.passwordController.text,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor:
                                    const Color.fromRGBO(213, 103, 205, 1)),
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Don't have an account? ",
                            ),
                            //apabila ingin ke registrasi
                            TextButton(
                              onPressed: () {
                                Get.offNamed('/register');
                              },
                              child: const Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
