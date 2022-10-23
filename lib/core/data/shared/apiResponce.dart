import 'dart:convert';

class ApiResponce{
  late String message;
  late bool status;

  ApiResponce({required this.message, required this.status});

  ApiResponce.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  status = json['status'] ?? false;
  }



}