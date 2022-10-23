import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_pro/resources/values.dart';
// import 'package:mobile_shop_app/resources/styles.dart';
// import 'package:mobile_shop_app/resources/values.dart';

import 'colors.dart';

ThemeData get defaultTheme => ThemeData(

  brightness: Brightness.light,
  primaryColor: Colors.blue,
  accentColor: Colors.lightBlueAccent,
  canvasColor: Colors.lightGreen.shade100,
  appBarTheme: const AppBarTheme(
    color: Colors.blue,
    iconTheme:  IconThemeData(
      color: Colors.white,
    ),
  ),
);


ThemeData get darkTheme => ThemeData(

  brightness: Brightness.dark,
  primaryColor: Colors.orange,
  accentColor: Colors.yellowAccent,
);

//
// ThemeData? customLightTheme() {
//
//   TextTheme _customLightThemesTextTheme(TextTheme base) {
//     return base.copyWith(
//       headline1: base.headline1!.copyWith(
//         // fontFamily: ‘Roboto’,
//         fontSize: 22.0,
//         color: Colors.green,
//       ),
//       headline2: base.headline2!.copyWith(
//           fontSize: AppSize.s22.sp,
//           color: ColorManager.primaryFontColor,
//         fontFamily: "Open Sans",
//         fontWeight: FontWeight.bold,
//         height: 0.9.h,
//       ),
//       headline6: base.headline6!.copyWith(
//           fontSize: 15.0.sp,
//           color: Colors.orange
//       ),
//       headline4: base.headline1!.copyWith(
//         fontSize: 24.0.sp,
//         color: Colors.white,
//       ),
//       headline3: base.headline1!.copyWith(
//         fontSize: AppSize.s22.sp,
//         color: Colors.grey,
//       ),
//       caption: base.caption!.copyWith(
//         color: const Color(0xFFCCC5AF),
//       ),
//       bodyText2: base.bodyText2!.copyWith(color: const Color(0xFF807A6B)),
//       bodyText1: base.bodyText1!.copyWith(color: Colors.brown),
//     );
//   }

//   final ThemeData lightTheme = ThemeData.light();
//   return lightTheme.copyWith(
//     textTheme: _customLightThemesTextTheme(lightTheme.textTheme),
//     primaryColor: const Color(0xffce107c),
//     indicatorColor: const Color(0xFF807A6B),
//     scaffoldBackgroundColor: const Color(0xFFF5F5F5),
//     accentColor: const Color(0xFFFFF8E1),
//     primaryIconTheme: lightTheme.primaryIconTheme.copyWith(
//       color: Colors.white,
//       size: 20,
//     ),
//     iconTheme: lightTheme.iconTheme.copyWith(
//       color: Colors.white,
//     ),
//     buttonColor: Colors.white,
//     backgroundColor: Colors.white,
//     tabBarTheme: lightTheme.tabBarTheme.copyWith(
//       labelColor: const Color(0xffce107c),
//       unselectedLabelColor: Colors.grey,
//     ),
//     buttonTheme: lightTheme.buttonTheme.copyWith(buttonColor: Colors.red),
//     // cursorColor: Colors.deepPurple,
//     errorColor: Colors.red,
//   );
// }


  ThemeData customDarkTheme() {
  final ThemeData darkTheme = ThemeData.dark();
  return darkTheme.copyWith(
    // scaffoldBackgroundColor: Color(0xFF252525),
    primaryColor: Colors.black38,
    indicatorColor: const Color(0xFF807A6B),
    accentColor: const Color(0xFFFFF8E1),
    primaryIconTheme: darkTheme.primaryIconTheme.copyWith(
      color: Colors.green,
      size: 20,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF252525)
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      titleSpacing: 24.w,
      actionsIconTheme: const IconThemeData(
        size: 18,
        color: Color(0xFF252525),
      ),
      backgroundColor: null,
      titleTextStyle: const TextStyle(fontSize: 43, color: Colors.white)
    )
    // cursorColor: Colors.green,
  );
}

// ThemeData get defaultTheme => ThemeData(
//   fontFamily: "Open Sans",
//   brightness: Brightness.light,
//   accentColor: Colors.lightBlueAccent,
//   canvasColor: ColorManager.backgroundColorMainPage,
//   textTheme: TextTheme(
//     headline1: getBoldStyle(color: Colors.black),
//     // TextStyle(
//     //   fontFamily: "Open Sans",
//     //   fontSize: 34,
//     //   fontWeight: FontWeight.w600,
//     //   color: Colors.black
//     // ),
//     headline2:  getBoldStyle(color: Colors.black),
//     headline3: const TextStyle(
//         fontSize: 17,
//         fontWeight: FontWeight.w600,
//         color: Colors.black
//     ),
//     // headline4:  TextStyle(
//     //     fontFamily: "Open Sans",
//     //     fontSize: 15,
//     //     fontWeight: FontWeight.w400,
//     //     color: Colors.black
//     // ),
//     // button:  TextStyle(
//     //     fontFamily: "Open Sans",
//     //     fontSize: 17,
//     //     fontWeight: FontWeight.w600,
//     //     color: Colors.black
//     // ),
//     // caption:  TextStyle(
//     //     fontFamily: "Open Sans",
//     //     fontSize: 12,
//     //     fontWeight: FontWeight.w400,
//     //     color: Colors.black
//     // ),
//     // bodyText1:  TextStyle(
//     //     fontFamily: "Open Sans",
//     //     fontSize: 15,
//     //     fontWeight: FontWeight.w400,
//     //     color: Colors.black
//     // ),
//     // bodyText2:  TextStyle(
//     //     fontFamily: "Open Sans",
//     //     fontSize: 13,
//     //     fontWeight: FontWeight.w400,
//     //     color: Colors.black
//     // ),
//     // bodySmall:  TextStyle(
//     //     fontFamily: "Open Sans",
//     //     fontSize: 11,
//     //     fontWeight: FontWeight.w400,
//     //     color: Colors.black
//     // ),
//   )
//
// );


// {TextStyle? displayLarge,
//     TextStyle? displayMedium,
// TextStyle? displaySmall,
//     TextStyle? headlineLarge,
// TextStyle? headlineMedium,
//     TextStyle? headlineSmall,
// TextStyle? titleLarge,
//     TextStyle? titleMedium,
// TextStyle? titleSmall,
//     TextStyle? bodyLarge,
// TextStyle? bodyMedium,
//     TextStyle? bodySmall,
// TextStyle? labelLarge,
//     TextStyle? labelMedium,
// TextStyle? labelSmall,
//     TextStyle? headline1,
// TextStyle? headline2,
//     TextStyle? headline3,
// TextStyle? headline4,
//     TextStyle? headline5,
// TextStyle? headline6,
//     TextStyle? subtitle1,
// TextStyle? subtitle2,
//     TextStyle? bodyText1,
// TextStyle? bodyText2,
//     TextStyle? caption,
// TextStyle? button,
//     TextStyle? overline}
// )