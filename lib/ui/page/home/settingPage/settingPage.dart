import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_pro/core/provider/authProvider.dart';
import 'package:note_app_pro/core/provider/themeProvider.dart';
import 'package:note_app_pro/resources/values.dart';
import 'package:provider/provider.dart';

import '../../../../routing/navigations.dart';
import '../../../shared/widget/gradientBox.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            title: const Text('Notes'),
            actions: [
            IconButton(
             onPressed: () {
               ServiceNavigations.serviceNavi.popFunction();
            },
                 icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF21AA93),
                  ))
            ],
    ),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addVerticalSpace(40.h),
        Container(
          margin: EdgeInsetsDirectional.only(start: 44.w, end: 44.w),
          width: double.infinity,
          height: 44.h,
          decoration: BoxDecoration(
            color: const Color(0xFF505050),
            borderRadius: BorderRadius.circular(6),
          ),
          child: MaterialButton(
            height: 0,
            onPressed: (){},
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: const Text('Language',
              style: TextStyle(
                color: Color(0xFF21AA93),
              ),),
          ),
        ),
        addVerticalSpace(40.h),
        Consumer<ThemeProvider>(
          builder: (context, theme, child){
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [
                        theme.color1,
                        theme.color2,
                      ]
                  )
              ),
              child:  Text(
                'Test',
                style: TextStyle(fontSize: theme.fontSize),
              ),
            );
          }
        ),
        addVerticalSpace(40.h),
        const Text("Font Size", style: TextStyle(fontSize: 25),),
        addVerticalSpace(20.h),
        Consumer<ThemeProvider>(
          builder: (context, theme, child){
            return Slider(
                value: theme.fontSize,
                max: 40,
                min: 18,
                onChanged: (value) {
                  theme.changeFontSize(value);
                });
          }
        ),
        addVerticalSpace(30.h),
        const Text('Color', style: TextStyle(fontSize: 25),),
        addVerticalSpace(30.h),
        Consumer<ThemeProvider>(
          builder: (context, theme, child){
            return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  GragientBox(color1: const Color(0xFF0074E1), color2: const Color(0xFF6BF5DE), onTap: (){ theme.changeColor(Color(0xFF0074E1), Color(0xFF6BF5DE));},),
                  GragientBox(color1: const Color(0xFFcc2b5e1), color2: const Color(0xFF753a88), onTap: (){ theme.changeColor(const Color(0xFFcc2b5e1), const Color(0xFF753a88));},),
                  GragientBox(color1: const Color(0xFF000428), color2: const Color(0xFF004e92), onTap: (){ theme.changeColor(const Color(0xFF000428), const Color(0xFF004e92));}),
                  GragientBox(color1: const Color(0xFFdd5e89), color2: const Color(0xFFf7bb97), onTap: (){ theme.changeColor(const Color(0xFFdd5e89), const Color(0xFFf7bb97));},),
                ]
            );
          }
        ),
        addVerticalSpace(40.h),
        Container(
          margin: EdgeInsetsDirectional.only(start: 44.w, end: 44.w),
          width: double.infinity,
          height: 44.h,
          decoration: BoxDecoration(
            color: const Color(0xFF505050),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Consumer<AuthProvider>(
            builder: (context, auth, child){
              return MaterialButton(
                height: 0,
                onPressed: (){
                  auth.logout();
                },
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: const Text('Logout',
                  style: TextStyle(
                    color: Color(0xFF21AA93),
                  ),),
              );
            }
          ),
        ),
      ],
      ),
    )
    ,
    );
  }
}
