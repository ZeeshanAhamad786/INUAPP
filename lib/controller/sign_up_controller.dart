import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inu/controller/utils/toast_message.dart';

import '../view/screens/authentications/login_screen.dart';
import 'image_picker_controller.dart';

class SignUpController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isLoading = false.obs;
  final ImagePickerController imagePickerController = Get.put(ImagePickerController());

  Future<void> signUp(BuildContext context) async {
    var userName = userNameController.text.trim();
    var userEmail = userEmailController.text.trim();
    var userPassword = passwordController.text.trim();
    var userConfirmPassword = confirmPasswordController.text.trim();

    if (userName.isEmpty || userEmail.isEmpty || userPassword.isEmpty || userConfirmPassword.isEmpty) {
      CustomToast.showToast(context, "All fields are required");
      return;
    } else if (!isValidEmail.hasMatch(userEmail)) {
      CustomToast.showToast(context, "Invalid email format");
      return;
    } else if (userPassword != userConfirmPassword) {
      CustomToast.showToast(context, "Passwords do not match");
      return;
    } else if (!isValidPassword.hasMatch(userPassword)) {
      CustomToast.showToast(context, "Password must be at least 8 characters long, include an uppercase letter, a lowercase letter, a number, and a special character.");
      return;
    } else if (imagePickerController.imagePath.value.isEmpty) {
      CustomToast.showToast(context, "Profile image is required");
      return;
    }

    try {
      isLoading.value = true;
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      log("User created successfully: ${userCredential.user!.uid}");

      // Upload image to Firebase Storage
      String imageUrl = await uploadImageToStorage(imagePickerController.imagePath.value);

      await FirebaseFirestore.instance.collection("users").doc(userCredential.user!.uid).set({
        "userName": userName,
        "userEmail": userEmail,
        "userPassword": userPassword,
        "userType": "teacher",
        "verified": false,
        "profileImageUrl": imageUrl,
      });

      log("User added to Firestore successfully");
      isLoading.value = false;
      // Navigate to verification screen or any other screen
      Get.off(() => const LoginScreen());
    } catch (e) {
      isLoading.value = false;
      log("Error creating user: $e");
      CustomToast.showToast(context, e.toString());
    }
  }

  Future<String> uploadImageToStorage(String imagePath) async {
    try {
      File file = File(imagePath);
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = FirebaseStorage.instance.ref().child('images').child(fileName);
      UploadTask uploadTask = ref.putFile(file);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      log("Image uploaded successfully: $downloadURL");
      return downloadURL;
    } catch (e) {
      log("Error uploading image: $e");
      throw e;
    }
  }
}

RegExp isValidEmail = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

RegExp isValidPassword = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
