import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inu/view/screens/authentications/verification_screen.dart';
import '../../../controller/utils/my_color.dart';
import '../../../controller/utils/shared_preferences.dart';
import '../home_section/home_screen.dart';
import 'register_screen.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  Future<void> checkUserStatus() async {
    String userDocId = MySharedPreferences.getString('userDocId');
    log(userDocId);
    if (userDocId.isNotEmpty) {
      try {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userDocId).get();
        if (userDoc.exists) {
          bool isVerified = userDoc['verified'] ?? false;
          if (isVerified) {
            Get.off(() => const HomeScreen());
          } else {
            Get.off(() => const VerificationScreen());
          }
        } else {
          Get.off(() => const RegisterScreen());
        }
      } catch (e) {
        log("Error checking user status: $e");
        Get.off(() => const RegisterScreen());
      }
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        Get.off(() => const RegisterScreen());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.blueColor,
      body: Center(child: Image.asset("assets/png/inuAppLogo.png")),
    );
  }
}
