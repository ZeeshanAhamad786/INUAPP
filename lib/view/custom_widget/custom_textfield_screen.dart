import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controller/utils/my_color.dart';
class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool isPassword;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.isPassword = false,
    // this.prefixIcon,
    this.suffixIcon,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        cursorColor: MyColor.greyColor, // Replace with your CustomColor.mainColor
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color:MyColor.greyColor// Replace with your CustomColor.mainEmailIconGreyColor
          ),
          contentPadding: EdgeInsets.all(10),
          // prefixIcon: Transform.scale(
          //   scale: 0.4,
          //   child: prefixIcon,
          //
          // ),
          suffixIcon: widget.isPassword ? GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: MyColor.greyColor,
            ),
          ) : null,
          // isDense: true,

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyColor.greyBorderColor,),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyColor.greyBorderColor,),
          ),
        ),
      );
  }
}



class CustomSearchTextField extends StatelessWidget {
  final String hintText;
  final TextStyle hintStyle;
  final Function(String)? onChanged;

  const CustomSearchTextField({
    Key? key,
    required this.hintText,
    required this.hintStyle,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: MyColor.blueColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        isCollapsed: true,
        contentPadding: EdgeInsets.all(10),
        prefixIcon: Transform.scale(
          scale: 0.5,
          child: SvgPicture.asset("assets/png/searchApp.svg"),
        ),
        hintText: hintText,
        hintStyle: hintStyle,
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: MyColor.blueColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: MyColor.blueColor),
        ),
      ),
      onChanged: onChanged,
    );
  }
}