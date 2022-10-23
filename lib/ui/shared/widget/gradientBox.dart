import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GragientBox extends StatelessWidget {
  GragientBox({required this.color1, required this.color2, required this.onTap});
  final Color color1;
  final Color color2;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  color1,
                  color2,
                ]
            ),
          )
      ),
    );
  }
}
