import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_pro/resources/values.dart';
import 'package:provider/provider.dart';
import '../../../../core/provider/noteProvider.dart';
import '../../../shared/widget/addNoteTextField.dart';

class AddNotePage extends StatelessWidget {
  AddNotePage({required this.noteController, required this.text,required this.hintText, required this.buttomText, required this.onPressed});

  final TextEditingController noteController;
  final String text;
  final String hintText;
  final String buttomText;
  final void Function()? onPressed;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(
        top: 30,
          start: 20,
          end: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            text,
            style: const TextStyle(
                fontSize: 22,),
            textAlign: TextAlign.start,
          ),
          AddNoteTextField(hintText: hintText, controller: noteController, inbutType: TextInputType.text),
          addVerticalSpace(10.h),
          Container(
            width: double.infinity,
            height: 44.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF0074E1),
                      Color(0xFF6BF5DE),
                    ])),
            child: Consumer<NoteProvider>(
              builder: (context, note, child){
                return MaterialButton(
                    onPressed: onPressed,
                    child: Text(
                      buttomText,
                      style: const TextStyle(color: Colors.white),
                    ),

                );
              },
            ),
          ),
          addVerticalSpace(20)
        ],
      ),
    );
  }
}
