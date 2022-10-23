import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app_pro/routing/router.dart';
import 'package:note_app_pro/ui/page/home/homePage.dart';
import 'package:note_app_pro/ui/page/home/settingPage/settingPage.dart';
import '../ui/page/auth/forgetPasswod.dart';
import '../ui/page/auth/loginScreen.dart';
import '../ui/page/auth/resetPassword.dart';
import '../ui/page/auth/signUp.dart';
import '../ui/page/splashPage.dart';


class RoutsGnerate{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteGenerator.splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      // case RouteGenerator.messangerPage:
      // return MaterialPageRoute(builder: (_) => const MessengerScreen());
      case RouteGenerator.loginPage:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteGenerator.signupPage:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case RouteGenerator.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RouteGenerator.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
      case RouteGenerator.resetPassword:
        return MaterialPageRoute(builder: (_) =>  ResetPassword());
      case RouteGenerator.settingPage:
        return MaterialPageRoute(builder: (_) =>  const SettingPage());
      default:
        throw const FormatException("Route not found");
    }
  }
}