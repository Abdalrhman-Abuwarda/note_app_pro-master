import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../../utils/helper.dart';
import '../../../models/studentModel.dart';
import '../../local/sharedController.dart';
import '../apiHelper.dart';
import '../apiResponce.dart';
import '../apiEndPoint.dart';
import '../baseClient.dart';
import '../handelException.dart';

class AuthRepository extends EndPoint with ApiHelper {
  Future<http.Response> register({required Student student}) async {
    Uri uri = Uri.parse(super.userRegister);
    http.Response response = await http.post(uri, body: {
      "full_name": student.fullName,
      "email": student.email,
      "password": student.password,
      "gender": student.gender,
    });
    return response;
  }


  Future<dynamic> loginRepository(
      {required String email, required String password}) async {
    debugPrint("This is email : $email");
    try {
      http.Response response =
          await BaseClient.baseClient.post(super.userLogin, body: {
        "email": email,
        "password": password,
      });
      if(response.statusCode == 200 || response.statusCode == 400){
        dynamic dataRespose = jsonDecode(response.body);
        print(dataRespose);
        return dataRespose;
      }else{
        returnResponse(response);
      }
    } catch (e) {
      print('this is in repostory $e');
    throw FetchDataException('');
    }
  }

  Future<dynamic> logoutRepository() async {
    debugPrint(SharedPrefController().getUser().token);
    try {
      http.Response responce =
          await BaseClient.baseClient.get(super.userLogOut, {
        HttpHeaders.authorizationHeader:
            'Bearer ${SharedPrefController().getUser().token}',
            "Accept": "application/json"
      });
      print("me "+responce.statusCode.toString());
      if (responce.statusCode == 200 || responce.statusCode == 401) {
        dynamic dataRespose = jsonDecode(responce.body);
        return dataRespose;
      }else{
        returnResponse(responce);
      }
    }
    catch (e) {
      print('this is in repostory $e');
      throw UnauthenticatedException("");
      // e is SocketException ? throw FetchDataException("$e") : "Not Socket Exception";
    }
    // Uri uri = Uri.parse(super.userLogOut);
    // var response = await http.get(uri, headers: {
    //   HttpHeaders.authorizationHeader: 'Bearer ${SharedPrefController().getUser().token}',
    //   HttpHeaders.acceptHeader: 'application/json'
    // });
    // return response;
  }

  Future<dynamic> forgetPasswordRepository(String email) async {
    try {
      dynamic response =
          await BaseClient.baseClient.post(super.userForgetPassword, body: {
        "email": email,
      });
      if(response.statusCode == 200 || response.statusCode == 400){
        dynamic dataRespose = jsonDecode(response.body);
        print(dataRespose);
        return dataRespose;
      }else{
        returnResponse(response);
      }
    } catch (e) {
      print('this is in repostory $e');
      throw FetchDataException('');
    }
  }

  Future<dynamic> resetPasswordRepository(
      {required String email,
      required String code,
      required String password}) async {
    try {
        dynamic response =
        await BaseClient.baseClient.post(super.userResetPassword, body: {
          "email": email,
          "code": code,
          "password": password,
          "password_confirmation": password,
        });
        if(response.statusCode == 200 || response.statusCode == 400) {
          dynamic dataRespose = jsonDecode(response.body);
          print(dataRespose);
        return dataRespose;
      }else{
        returnResponse(response);
      }
    } catch (e) {
      print('this is in repostory $e');
      throw FetchDataException('');
    }
  }
}
