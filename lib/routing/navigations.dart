import 'package:flutter/material.dart';
class ServiceNavigations{
  ServiceNavigations._();
  static ServiceNavigations serviceNavi = ServiceNavigations._();
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  pushNamedWidget(String name) {
    navKey.currentState?.pushNamed(name);
  }
// Key + inside material app
  pushNamedReplacement(String name){
    navKey.currentState?.pushReplacementNamed(name);
  }

  popFunction() {
    navKey.currentState?.pop();
  }

  pushNamedAndRemoveUtils(String name){
    navKey.currentState?.pushNamedAndRemoveUntil(name, (route) => false);
  }

  // pushnamed
  // pushnamedandremoveutils
  // pop


}