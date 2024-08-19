import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:inu/view/screens/authentications/verification_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/image_picker_controller.dart';
import '../../../controller/sign_up_controller.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../custom_widget/custom_main_button.dart';
import '../../custom_widget/custom_textfield_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ImagePickerController imagePickerController = Get.put(ImagePickerController());
  SignUpController signUpController =Get.put(SignUpController());

  @override
  void dispose() {
    imagePickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
     Obx(() =>  Scaffold(
       backgroundColor: Colors.white,
       body: Center(
         child: Padding(
           padding: EdgeInsets.symmetric(horizontal: 3.h),
           child: SingleChildScrollView(
             child: Column(
               children: [
                 SizedBox(height: 12.h),
                 Text("Register", style: Constant.textRegister),
                 SizedBox(height: 4.h),
                 GestureDetector(
                   onTap: () {
                     imagePickerController.getImage();
                   },
                   child: Stack(
                     children: [
                       CircleAvatar(
                         backgroundImage: imagePickerController.imagePath.isNotEmpty
                             ? FileImage(File(imagePickerController.imagePath.toString()))
                             : AssetImage("assets/png/profileCtt.png") as ImageProvider,
                         radius: 60,
                       ),
                       Positioned(
                         bottom: 0,
                         right: 0.2,
                         child: Container(
                           height: 50,
                           width: 50,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(30),
                               color: Colors.white),
                           child: Center(
                             child: Container(
                               height: 35,
                               width: 35,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(30),
                                   color: MyColor.backgroundProfile),
                               child: Transform.scale(
                                   scale: 0.5,
                                   child: SvgPicture.asset(
                                     "assets/svg/cameraProfile.svg",
                                   )),
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(height: 4.h),
                 CustomTextField(
                   hintText: "Enter Full Name", controller: signUpController.userNameController,),
                 SizedBox(height: 1.3.h),
                 CustomTextField(controller: signUpController.userEmailController,
                     hintText: "Enter Email"),
                 SizedBox(height: 1.3.h),
                 CustomTextField(
                   controller: signUpController.passwordController,
                   hintText: "Enter Password",
                   suffixIcon: Icon(Icons.remove_red_eye_sharp),
                 ),
                 SizedBox(height: 1.3.h),
                 CustomTextField(controller: signUpController.confirmPasswordController,
                   hintText: "Enter Password Again",
                   suffixIcon: Icon(Icons.remove_red_eye_sharp),
                 ),
                 SizedBox(height: 1.3.h),
                 signUpController.isLoading.value? const Center(child: CircularProgressIndicator(color: MyColor.blueColor,))
                     : CustomMainButton(
                   buttonColor: MyColor.blueColor,
                   buttonText: "Continue",
                   onPressed: () {
                     signUpController.signUp(context);
                     // Get.to(() => const VerificationScreen());
                   },
                 ),
                 SizedBox(height: 3.h),
                 GestureDetector(
                   onTap: () {
                     Get.to(() => const LoginScreen());
                   },
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Flexible(
                         child: Text(
                           "Already have an account? ",
                           style: Constant.textGreySign,
                         ),
                       ),
                       SizedBox(width: 0.5.w),
                       Flexible(
                         child: GestureDetector(
                           onTap: () {
                             Get.to(() => const LoginScreen());
                           },
                           child: Text(
                             "Sign In",
                             style: Constant.textBlueSign,
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(height: 3.h),
               ],
             ),
           ),
         ),
       ),
     ));
  }
}
