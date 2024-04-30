//import-import yang di butuhkan
//sizeBox dan Padding di sini berguna untuk pembatas
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengatur preferensi orientasi potret
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                //gambar backgound
                image: AssetImage('assets/images/Backgound Home.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //teks sambutan dan nama
                                Obx(() => Text(
                                      "Hello, ${controller.name.value}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                //teks sapaan
                                Text(
                                  "How's your day going?",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            //circle Avatarnya
                            Obx(() => CircleAvatar(
                                  backgroundImage: controller
                                          .imageURL.value.isNotEmpty
                                      ? NetworkImage(controller.imageURL.value)
                                      : const AssetImage(
                                              'assets/images/Person.png')
                                          as ImageProvider,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        //Br di Html ato pembatas garis
                        child: Divider(
                          color: const Color.fromRGBO(212, 212, 212, 1),
                          thickness: 1,
                          height: 20.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //teks Phone Numbernya
                            Obx(() => Text(
                                  "My Phone Number : ${controller.phoneNumber.value}",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                )),
                            //teks Address
                            Obx(() => Text(
                                  "My Address : ${controller.address.value}",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                )),
                            //teks Email
                            Obx(() => Text(
                                  "My Email : ${controller.email.value}",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 150.h,
                  ),
                  SizedBox(
                    width: 300.w,
                    //elevated Buttonnya untuk Upload atau update Profile
                    child: ElevatedButton(
                      onPressed: () async {
                        controller.pickImage();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color.fromRGBO(213, 103, 205, 1),
                      ),
                      child: const Text(
                        'Upload Foto',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
