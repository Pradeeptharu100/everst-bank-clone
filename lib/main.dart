import 'package:ebl_app/firebase_options.dart';
import 'package:ebl_app/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const BankingApp());
}

class BankingApp extends StatelessWidget {
  const BankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final screenSize = Size(constraints.maxWidth, constraints.maxHeight);
      return ScreenUtilInit(
        designSize: screenSize,
        builder: (context, child) => GetMaterialApp(
          title: 'EBL TOUCH',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color(0xFFB71C1C),
            scaffoldBackgroundColor: Colors.white,
          ),
          home: LoginScreen(),
        ),
      );
    });
  }
}
