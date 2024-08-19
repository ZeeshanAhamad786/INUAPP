import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../custom_widget/custom_main_button.dart';
class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 3.h),
            child: Column(children: [
              getVertical(12.h),
              Text("Verification",style: Constant.textRegister,),
              getVertical(10.h),
              Image.asset("assets/png/verificationApp.png",),
              getVertical(2.h),
              Text("""Your Registration Info has been sent\n to authorities when they approve, you\n will be able to use the portal""",
                style:Constant.textBlackShine ,
              ),
              getVertical(6.h),getHorizontal(6.h)
            ],),
          ),
        ),
      ),
    );
  }
}

