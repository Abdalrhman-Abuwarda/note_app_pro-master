import 'package:flutter/material.dart';

import 'fonts.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight);
}


TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style

// TextStyle getMediumStyle(
//     {double fontSize = FontSize.s12, required Color color}) {
//   return _getTextStyle(fontSize, FontWeightManager.medium, color);
// }

// Light style

// TextStyle getLightStyle(
//     {double fontSize = FontSize.s12, required Color color}) {
//   return _getTextStyle(fontSize, FontWeightManager.light, color);
// }
// Extra Light style

// TextStyle getExtraLightStyle(
//     {double fontSize = FontSize.s12, required Color color}) {
//   return _getTextStyle(fontSize, FontWeightManager.extraLight, color);
// }

// bold style
TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

//extra bold style
// TextStyle getExtraBoldStyle(
//     {double fontSize = FontSize.s12, required Color color}) {
//   return _getTextStyle(fontSize, FontWeightManager.extraBold, color);
// }
//semi bold style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}
// black style
// TextStyle getBlackStyle(
//     { double fontSize =  FontSize.s12, required Color color}) {
//   return _getTextStyle(fontSize, FontWeightManager.black, color);
// }
