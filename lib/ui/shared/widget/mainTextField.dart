import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MainTextField extends StatelessWidget {

  const MainTextField({
    required this.hintText,
    required this.controller,
    required this.icon,
    required this.inbutType,
    required this.validator,
    this.suffixIcon,
    this.isPassword =false,
    this.suffixPressed
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType inbutType;
  final IconData icon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final bool isPassword;
  final Function()? suffixPressed;


  @override
  Widget build(BuildContext context) {
    return TextFormField(

      cursorColor: const Color(0xFF21AA93),
      // cursorColor: Colors.red,
      obscureText: isPassword,
      controller: controller,
      // onFieldSubmitted: (_) => ,


      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF3B3B3B),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Color(0xFF21AA93),
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        suffixIconColor: const Color(0xFF21AA93),
          hintText: hintText ,
        contentPadding:
        const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          hintStyle: const TextStyle( color: Color(0xFFBDBDBD),),
          prefixIcon:  Icon(
            icon,
            color: const Color(0xFF21AA93),size:27
          ),
        suffixIcon: suffixIcon != null ? IconButton(
          icon: Icon(suffixIcon, color: const Color(0xFF21AA93),),
          onPressed: suffixPressed) : null,
      ),
      validator: validator,
      keyboardType: inbutType,
    );
  }
}
