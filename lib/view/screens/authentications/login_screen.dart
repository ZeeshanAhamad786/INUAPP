import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:inu/view/screens/authentications/forgot_password_screen.dart';
import 'package:inu/view/screens/authentications/register_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/login_controller.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../custom_widget/custom_main_button.dart';
import '../../custom_widget/custom_textfield_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 3.h),
            child: SingleChildScrollView(
              child: Column(children: [
                getVertical(12.h),
                Text("Login",style: Constant.textRegister,),
                getVertical(2.h),
                Image.asset("assets/png/loginApp.png",width: 230.px,height: 270.px,),
                getVertical(2.h),
                CustomTextField(controller: loginController.userEmailController,
                    hintText: "Enter Email"),
                getVertical(1.3.h),
                CustomTextField(controller: loginController.passwordController,
                  hintText: "Enter Password",suffixIcon: Icon(Icons.remove_red_eye_sharp),),
                getVertical(1.h),
                Align(alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: (){
                          Get.to(()=>const ForgotPasswordScreen());
                        },
                        child: Text("Forgot Password?",style: Constant.textForgot1,))),
                getVertical(1.3.h),
                Obx(() =>  loginController.isLoading.value?const Center(child: CircularProgressIndicator(color: MyColor.blueColor,)) :
                CustomMainButton(buttonColor: MyColor.blueColor,
                    buttonText: "Login", onPressed: (){
                      loginController.login(context);
                      // Get.offAll(()=>const HomeScreen());
                    }),),
                getVertical(3.h),
                GestureDetector(onTap:() {
                  Get.to(()=>const RegisterScreen());
                },
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(child: Text("Already have an account ? ",style: Constant.textGreySign,)),
                      getHorizontal(.5.w),
                      Flexible(child: GestureDetector(onTap: () {
                        Get.to(()=>const RegisterScreen());
                      },
                          child: Text("Sign Up",style: Constant.textBlueSign,))),
                    ],
                  ),
                ),
                getVertical(3.h),getHorizontal(3.h)

              ],),
            ),
          ),
        ),
      );
  }
}
