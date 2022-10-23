import 'package:flutter/material.dart';
import 'package:note_app_pro/core/provider/themeProvider.dart';
import 'package:provider/provider.dart';

import 'gradientText.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({
    required this.text, required this.gradientText
  }) ;

  final String text;
  final String gradientText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
        Consumer<ThemeProvider>(
          builder: (context, theme, child){
            return GradientText(
              gradientText,
              style: const TextStyle(fontSize: 40),
              gradient:  LinearGradient(colors: [
                theme.color1,
                theme.color2,
              ]),
            );
          }
        ),
      ],
    );
  }
}
