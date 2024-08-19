import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inu/controller/utils/toast_message.dart';
import 'package:inu/view/screens/authentications/login_screen.dart';

class ForgotController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  RxBool isLoading = false.obs;

  Future<void> forgotPassword(BuildContext context) async {
    if (emailController.text.trim().isEmpty) {
      CustomToast.showToast(context, "Please enter your email address.");
      return;
    }

    try {
      isLoading.value = true;
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
      CustomToast.showToast(context, "We have sent you an email to recover your password.");
      emailController.clear();
      Get.to(const LoginScreen());
    } catch (error) {
      CustomToast.showToast(context, error.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
