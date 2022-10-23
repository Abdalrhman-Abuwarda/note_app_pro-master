import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
   Color color1 = const Color(0xFF0074E1);
   Color color2 = const Color(0xFF6BF5DE);

   double fontSize = 20;

   void changeFontSize(double value){
     fontSize = value;
     notifyListeners();
   }

   void changeColor(Color col1, col2){
     color1 = col1;
     color2 = col2;
     notifyListeners();
   }

  // void changeColor2(){
  //   color1 = const Color(0xFFcc2b5e1);
  //   color2 = const Color(0xFF753a88);
  //   notifyListeners();
  // }
  //
  // void changeColor3(){
  //   color1 = const Color(0xFF000428);
  //   color2 = const Color(0xFF004e92);
  //   notifyListeners();
  // }
  // void changeColor4(){
  //   color1 = const Color(0xFFdd5e89);
  //   color2 = const Color(0xFFf7bb97);
  //   notifyListeners();
  // }
  //
  // void initColor(){
  //    color1 = const Color(0xFF0074E1);
  //    color2 = const Color(0xFF6BF5DE);
  //   notifyListeners();
  // }
}