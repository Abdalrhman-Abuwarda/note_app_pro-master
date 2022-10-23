import 'package:flutter/material.dart';
class RadioTile extends StatelessWidget {
  const RadioTile({required this.value, required this.groupValue, required this.onChange, required this.text});
  final String value;
  final String? groupValue;
  final String text;
  final Function(String?)? onChange;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: const Color(0xFF3B3B3B),
            borderRadius: BorderRadius.circular(10)),
        child: RadioListTile<String>(
          title: Text(text,
              style: TextStyle(color: Color(0xFFBDBDBD))),
          value: value,
          groupValue: groupValue,
          onChanged: onChange,
        ),
      ),
    );
  }
}
