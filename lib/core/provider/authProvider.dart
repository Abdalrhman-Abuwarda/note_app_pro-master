import 'dart:convert';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:note_app_pro/utils/helper.dart';
import 'package:provider/provider.dart';
import '../../routing/navigations.dart';
import '../../routing/router.dart';
import '../data/local/sharedController.dart';
import '../data/shared/Repository/authRepository.dart';
import '../data/shared/apiHelper.dart';
import '../data/shared/apiResponce.dart';
import '../models/studentModel.dart';
import 'noteProvider.dart';

class AuthProvider extends ChangeNotifier with ApiHelper {
  Future<dynamic> login(
    String email,
    String password,
  ) async {
    try {
      dynamic dataResponce = await AuthRepository()
          .loginRepository(email: email, password: password);
      dynamic responce = ApiResponce.fromJson(dataResponce);
      print(responce.status);
      if (responce.status == true) {
        Student student = Student.fromJson(dataResponce['object']);
        SharedPrefController().saveData(student: student);
        print(student.fullName);
        Helpers.showSnackBar(message: responce.message);
        ServiceNavigations.serviceNavi
            .pushNamedReplacement(RouteGenerator.homePage);
      } else {
        Helpers.showSnackBar(message: responce.message);
      }
      // }

    } catch (e,s) {
      print('This is in Provider${e.toString()}');
      print('This is in Stack ${s.toString()}');
      Helpers.showSnackBar(message: e.toString());
    }
  }

  Future<void> register(Student student) async {
    Response dataRisponse = await AuthRepository().register(student: student);
    if (dataRisponse.statusCode == 201 || dataRisponse.statusCode == 400) {
      ApiResponce responce =
          ApiResponce.fromJson(jsonDecode(dataRisponse.body));
      if (responce.status == true) {
        Helpers.showSnackBar(message: responce.message);
        ServiceNavigations.serviceNavi
            .pushNamedWidget(RouteGenerator.loginPage);
      }
    }
  }

  Future<void> logout() async {
    try {
      dynamic dataRisponse = await AuthRepository().logoutRepository();
      print(dataRisponse);

      SharedPrefController().logout();
      Provider.of<NoteProvider>(
              ServiceNavigations.serviceNavi.navKey.currentContext!,
              listen: false)
          .clearTask();
      ApiResponce apiResponce = ApiResponce.fromJson(dataRisponse);
      if(apiResponce.status == true) {
        Helpers.showSnackBar(message: apiResponce.message);
      }
      else{
        Helpers.showSnackBar(message: "Your account login in anther device");
      }
      ServiceNavigations.serviceNavi
          .pushNamedAndRemoveUtils(RouteGenerator.loginPage);
      print(dataRisponse.toString());
    }
    catch (e,s) {
      print('This is in the stack $s');
      print(" this is in provider ${e.toString()}");
      Helpers.showSnackBar(message: '$e');
    }
  }

  Future<void> forgetPassword(String email) async {
    dynamic dataResponse = await AuthRepository().forgetPasswordRepository(email);
    try {
      ApiResponce responce = ApiResponce.fromJson(dataResponse);
      if (responce.status) {
        Helpers.showSnackBar(message: dataResponse["code"].toString());
        ServiceNavigations.serviceNavi
            .pushNamedWidget(RouteGenerator.resetPassword);
      } else {
        Helpers.showSnackBar(message: responce.message);
      }
    } catch (e) {
      print('This is in Provider $e');
    }
  }

  Future<dynamic> resetPassword(
      String email, String code, String password) async {
    try {
      dynamic dataResponse = await AuthRepository()
          .resetPasswordRepository(email: email, code: code, password: password);
      ApiResponce responce = ApiResponce.fromJson(dataResponse);
      if (responce.status) {
        Helpers.showSnackBar(message: responce.message);
        ServiceNavigations.serviceNavi
            .pushNamedWidget(RouteGenerator.loginPage);
      } else {
        Helpers.showSnackBar(message: responce.message);
      }
    } catch (e) {
      // throw e;
      print('This is in Provider$e');
    }

  }
}

