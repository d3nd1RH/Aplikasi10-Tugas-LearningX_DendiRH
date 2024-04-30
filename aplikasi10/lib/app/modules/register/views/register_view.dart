//import-import yang di butuhkan
//sizeBox dan Padding di sini berguna untuk pembatas
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
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
            //Gambar backgound
            image: AssetImage('assets/images/Backgound Login & Register.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //teks besar
                Text(
                  'Register Your Account',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: 300.w,
                  child: Form(
                    key: controller.formKey,
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
                        //TextFormField nya
                        TextFormField(
                          controller: controller.usernameController,
                          decoration: InputDecoration(
                            hintText: 'Username here...',
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(212, 212, 212, 1),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(212, 212, 212, 1),
                              ),
                            ),
                          ),
                          //validasi kalau kosong
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 8.h),
                        //teks sebelum TextFormField
                        Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        //TextFormField nya
                        TextFormField(
                          controller: controller.nameController,
                          decoration: InputDecoration(
                            hintText: 'Name  here...',
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(212, 212, 212, 1),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.5),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(212, 212, 212, 1),
                              ),
                            ),
                          ),
                          //validasi kalau kosong
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 8.h),
                        //teks sebelum TextFormField
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        //TextFormField nya
                        TextFormField(
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            hintText: 'Email  here...',
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(212, 212, 212, 1),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.5),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(212, 212, 212, 1),
                              ),
                            ),
                          ),
                          //validasi kalau kosong dan apabila bukan email
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!value.isEmail) {
                              return 'Please enter email Correctly';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 8.h),
                        //teks sebelum TextFormField
                        Text(
                          'Address',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        //TextFormField nya
                        TextFormField(
                          controller: controller.addressController,
                          decoration: InputDecoration(
                            hintText: 'Address  here...',
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(212, 212, 212, 1),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.5),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(212, 212, 212, 1),
                              ),
                            ),
                          ),
                          //validasi kalau kosong
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 8.h),
                        //teks sebelum TextFormField
                        Text(
                          'Phone Number',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        //TextFormField nya
                        TextFormField(
                          controller: controller.phoneNumberController,
                          decoration: InputDecoration(
                            hintText: 'Phone Number  here...',
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(212, 212, 212, 1),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.5),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(212, 212, 212, 1),
                              ),
                            ),
                          ),
                          //validasi kalau kosong
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 8.h),
                        //teks sebelum TextFormField
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        //TextFormField nya
                        TextFormField(
                          controller: controller.passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password here...',
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(212, 212, 212, 1),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.5),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(212, 212, 212, 1),
                              ),
                            ),
                          ),
                          //validasi kalau kosong
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 8.h),
                        //teks sebelum TextFormField
                        Text(
                          'Confirm Password',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        //TextFormField nya
                        TextFormField(
                          controller: controller.confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password here...',
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(212, 212, 212, 1),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.5),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(212, 212, 212, 1),
                              ),
                            ),
                          ),
                          //validasi kalau kosong
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 8.h),
                        SizedBox(
                          width: double.infinity,
                          //ElevatedButton untuk pengecek dan registarsinya
                          child: ElevatedButton(
                            onPressed: () async {
                              await controller.register(
                                controller.usernameController.text,
                                controller.nameController.text,
                                controller.emailController.text,
                                controller.addressController.text,
                                int.tryParse(controller
                                        .phoneNumberController.text) ??
                                    0,
                                controller.passwordController.text,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor:
                                  const Color.fromRGBO(213, 103, 205, 1),
                            ),
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Already have an account ?"),
                            //teks button untuk langsung pergi ke login tanpa register
                            TextButton(
                              onPressed: () {
                                Get.offNamed('/login');
                              },
                              child: const Text(
                                'Log in',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
