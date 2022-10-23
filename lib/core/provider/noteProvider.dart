import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:note_app_pro/core/data/shared/apiResponce.dart';
import 'package:note_app_pro/core/models/taskModel.dart';
import 'package:provider/provider.dart';
import '../../routing/navigations.dart';
import '../../utils/helper.dart';
import '../data/shared/Repository/noteRepository.dart';
import 'authProvider.dart';

class NoteProvider with ChangeNotifier {
  // NoteProvider(
  // readNote()
  //     );
  List<Task>? tasks;
  final contextKey = ServiceNavigations.serviceNavi.navKey.currentContext!;
  var provider = Provider.of<AuthProvider>(
      ServiceNavigations.serviceNavi.navKey.currentContext!,
      listen: false);
  final List filterTask = [];
  List datesFilterTask = [];

  bool visable = false;

  Future<dynamic> createNote(String title) async {
    try {
      dynamic dataRisponse =
          await NoteApiController().createRepository(title: title);
      ApiResponce responce = ApiResponce.fromJson(dataRisponse);
      print(responce.message);
      if (responce.status) {
        Helpers.showSnackBar(message: responce.message);
        Task task = Task.fromJson(dataRisponse["data"]);
        tasks?.add(task);
        ServiceNavigations.serviceNavi.popFunction();
        print(task.title);
      } else {
        showDialog(
            context: contextKey,
            builder: (Context) => alertDialog(
                  title: 'Warning',
                  content: "Your account login in anther divice",
                  onPressed: () {
                    provider.logout();
                  },
                ));
      }
    } catch (e) {
      print('This is in Provider $e');
    }
    notifyListeners();
  }

  Future<dynamic> readNote() async {
    try {
      dynamic dataResponse = await NoteApiController().readRepository();
      // ApiResponce apiResponce = ApiResponce.fromJson(dataResponse);
      // if(apiResponce.status == true){
      List<dynamic> dataList = dataResponse["data"];
      print(dataList);
      tasks = dataList.map((value) => Task.fromJson(value)).toList();
      print('first element ${tasks}');
      filterList();
      // }
      // else{
      //   showDialog(
      //       context: contextKey,
      //       builder: (Context) => alertDialog(
      //         title: 'Warning',
      //         content: "Your account login in anther divice",
      //         onPressed: () {
      //           provider.logout();
      //         },
      //       ));
      // }
    } catch (e) {
      print('This is in Provider$e');
      Helpers.showSnackBar(message: '$e');
    }
    notifyListeners();

    // List<dynamic> jsonTasks = jsonDecode(dataResponse.body)["data"] as List;
    // print(dataList);
    // dataList.forEach((element) {
    //   tasks!.add(Task.fromJson(element));
    // });
  }

  Future<dynamic> delete(int id) async {
    try {
      final dataResponse = await NoteApiController().deleteRepository(id);
      // ApiResponce apiResponce = ApiResponce.fromJson(dataResponse);
      if (dataResponse!.status) {
        tasks!.removeWhere((item) => item.id == id);
        Helpers.showSnackBar(message: dataResponse.message);
        ServiceNavigations.serviceNavi.popFunction();
      } else {
        showDialog(
            context: contextKey,
            builder: (Context) => alertDialog(
                  title: 'Warning',
                  content: "Your account login in anther divice",
                  onPressed: () {
                    provider.logout();
                  },
                ));
      }
    } catch (e) {
      throw Exception(e);
      // print('This is in Provideer$e');
    }
    notifyListeners();
  }

  Future<dynamic> update({
    required int id,
    required String titel,
  }) async {
    try {
      dynamic dataResponse =
          await NoteApiController().updateRepository(id, titel);
      ApiResponce apiResponce = ApiResponce.fromJson(dataResponse);
      int index = tasks!.indexWhere((item) => item.id == id);
      tasks![index].title = titel;
      Helpers.showSnackBar(message: apiResponce.message);
      ServiceNavigations.serviceNavi.popFunction();
    } catch (e) {
      print('This is in the Provider $e');
    }

    notifyListeners();
  }

  void clearTask() {
    tasks = null;
    // print(tasks!.length);
    notifyListeners();
  }

  visableDate() {

  }

  Set dates = {};
  filterList() {
    if(tasks!.isNotEmpty){
      for(var value in tasks!){
        dates.add(value.created_at.substring(0, 10));
      }
    }
    datesFilterTask = dates.toList();
    print(datesFilterTask);


    // print(dates);
    // if(tasks!.isNotEmpty){
    //   for (var x = 0; x < tasks!.length; x++){
    //     for(var i = tasks!.length; i > tasks!.length-1; i--){
    //       if(tasks![x].created_at.substring(0, 10) == )
    //     }
    //   }
    // }
    // if (tasks!.isNotEmpty) {
    //   for (var x = 0; x <= tasks!.length; x++) {
    //     for (var i = x + 1; i <= tasks!.length; i++) {
    //       if (tasks![x].created_at.substring(0, 10) == tasks![i].created_at.substring(0, 10)) {
    //         print(tasks![x].created_at.substring(0, 10));
    //         // filterTask.add(tasks![x]);
    //       }
    //     }
    //     // print(filterTask);
    //   }
    // }
  }
}

// if (tasks!.isNotEmpty) {
// for (var element in tasks!) {
// dateTask.add(element.created_at.substring(0, 10));
// for(var value in dateTask) {
// if(value == element.created_at.substring(0, 10)) {
// filterTask.add(element);
// }
// }
// }
// // for(var element in tasks!){
// //
// //   // fliterTask.add(element.created_at == dateTask[0]);
// // }
// print(dateTask);
// }
