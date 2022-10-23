import 'dart:convert';

import 'package:note_app_pro/core/data/shared/apiEndPoint.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:note_app_pro/core/data/shared/baseClient.dart';
import '../../local/sharedController.dart';
import '../apiHelper.dart';
import '../apiResponce.dart';
import '../baseClient.dart';
import '../handelException.dart';

class NoteApiController extends EndPoint with ApiHelper {

  Future<dynamic> createRepository({required String title}) async {
     try{http.Response response = await BaseClient.baseClient.post(super.noteUri, headers: {HttpHeaders.authorizationHeader: 'Bearer ${SharedPrefController().getUser().token}',HttpHeaders.acceptHeader: 'application/json'},
         body: {"title": title});
     if(response.statusCode == 201 || response.statusCode == 401){
       var dataResponse = jsonDecode(response.body);
       return dataResponse;
     }else{
       returnResponse(response);
     }
     }catch (e) {
    print('this is in repostory $e');
    throw FetchDataException('');
    }
  }

  Future<dynamic> readRepository() async {

    try {
      http.Response response = await BaseClient.baseClient.get(super.getNoteUri, {
        HttpHeaders.authorizationHeader:
            'Bearer ${SharedPrefController().getUser().token}'
      });
      if(response.statusCode == 200 || response.statusCode == 401){
        dynamic dataRespose = jsonDecode(response.body);
        return dataRespose;
      }else{
        returnResponse(response);
      }
      } on SocketException catch(e){
      throw FetchDataException("");
    }
      catch (e) {
      print('this is in repostory $e');
      // e is SocketException ? throw Exception(e) : "Not Socket Exception";
    }
  }

    // ? apiResponce;
  Future<ApiResponce?> deleteRepository(int id) async {
    try{
      http.Response response =
          await BaseClient.baseClient.delete('${super.noteUri}/$id', {
        HttpHeaders.authorizationHeader:
            'Bearer ${SharedPrefController().getUser().token}',
      });
      print(response.body);
      // print('This is Fuck${response.statusCode}');
      if(response.statusCode == 200 || response.statusCode == 401) {
        final dataResponse = jsonDecode(response.body);
        ApiResponce apiResponce = ApiResponce.fromJson(dataResponse);
        return apiResponce;
      }
      // return apiResponce;
    }catch(e){
      print('This is the Rpository$e');
    }
  }

  Future<dynamic> updateRepository(int id, String titel) async {
    try{
      http.Response response = await BaseClient.baseClient.put('${super.noteUri}/$id',
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${SharedPrefController().getUser().token}'},
          body: {"title": titel});
      print('This is in parrrrr ${response.body}');
      if(response.statusCode == 200 || response.statusCode == 401){
      final dataResponse = jsonDecode(response.body);
      return dataResponse;
      }
    }catch(e){
      print("this is in the Rpository $e");
      throw Exception(e);
    }
  }
}
