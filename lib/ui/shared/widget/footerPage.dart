import 'package:flutter/material.dart';


class FooterPage extends StatelessWidget {
  FooterPage({required this.text, required this.textButtom, required this.onPressed});
 final String text;
 final String textButtom;
 final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(
            onPressed: onPressed,
            child: Text(textButtom))
      ],
    );
  }
}

// Navigator.of(context).pushNamed(RouteGenerator.loginPage);