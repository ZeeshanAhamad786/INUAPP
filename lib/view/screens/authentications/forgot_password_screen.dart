import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inu/controller/utils/my_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/forgot_controller.dart';
import '../../../controller/utils/constant.dart';
import '../../custom_widget/custom_main_button.dart';
import '../../custom_widget/custom_textfield_screen.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}
class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  ForgotController forgotController =Get.put(ForgotController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.whiterColor,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.h),
            margin: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
            child: Column(
              children: [
                getVertical(4.h),
                Text("Forgot Password",style: Constant.textName,),
                getVertical(2.h),
                Text("Please enter your registered mail address",style: Constant.textTeacherNumber,),
                getVertical(2.h),
                Image.asset("assets/png/loginImage.png",height: 200.px,width: 20.w,),
                getVertical(2.h),
                CustomTextField(hintText: "Enter Email", controller:forgotController.emailController,),
                getVertical(2.2.h),
              Obx(() =>   forgotController.isLoading.value?const Center(child: CircularProgressIndicator(color: MyColor.blueColor,))
                  :  CustomMainButton(buttonColor: MyColor.blueColor,
                buttonText: 'Done', onPressed: () {
                  forgotController.forgotPassword(context);
                },),),
                getVertical(6.h),getHorizontal(6.h)
              ],
            ),
          )
        ],),
      ),
    );
  }
}
