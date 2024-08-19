import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controller/utils/constant.dart';
class CustomMainButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color? buttonColor;

  // final  RxBool? loading;

  CustomMainButton({
    required this.buttonText,
    required this.onPressed,
    this.buttonColor,
    // this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        fixedSize: Size( MediaQuery.of(context).size.width, 6.h),
        backgroundColor: buttonColor,

        // Text color
      ),
      child: Text(buttonText,
        textAlign: TextAlign.center,
        style:  Constant.textButton,

      ),
    );
  }
}



Widget getHorizontal(double width){
  return SizedBox(width: width,);
}
Widget getVertical(double height){
  return SizedBox(height: height,);
}