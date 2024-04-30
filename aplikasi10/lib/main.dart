//import-import yang di butuhkan
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  //inisialisasi firebase
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCPHHLvnGUUHYm2QamOwR7TK7Lskn2ztsY",
      appId: "1:720605353580:android:a442120797b8f7ec952a49",
      messagingSenderId: "720605353580",
      projectId: "tugas10-90ce5",
      storageBucket: "gs://tugas10-90ce5.appspot.com",
    ),
  );
  await Firebase.initializeApp();
  runApp(
    //inisialisasi ScreenUtil dan tema
    ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) => GetMaterialApp(
              title: "Application",
              debugShowCheckedModeBanner: false,
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              theme: ThemeData(
                primaryColor: Colors.black,
                fontFamily: 'Poppins',
              ),
            )),
  );
}
