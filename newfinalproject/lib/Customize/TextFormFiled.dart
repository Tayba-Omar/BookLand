import 'package:flutter/material.dart';

import '../Style/Color.dart';

class Textformfiled extends StatelessWidget {
  String lbl;
  String? hint;
  IconData? preIcon;
  IconData? suffIcon;
  String? Function(String?)? toCheck;


  Textformfiled({  required this.lbl,
    this.hint,
    this.preIcon,
    this.suffIcon,
    this.toCheck
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311,
      child: TextFormField(
        validator: toCheck,
        decoration: InputDecoration(
            label: Text(lbl,style: TextStyle(fontSize: 25,
        color: txtMainColor,)
            ),
            hintText: hint,
            prefixIcon: Icon(preIcon,color: txtMainColor,
              size: 20,),
            suffixIcon: Icon(suffIcon,color:txtMainColor,
              size: 20,),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: txtMainColor,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: txtColor,
                  width: 4
              ),
              borderRadius: BorderRadius.circular(20),
            )
        ),
      ),
    );
  }
}




bool uesrNameValidation(input){
  String pattern = r"[a-zA-Z][a-zA-Z0-9_]{2,15}";
  return RegExp(pattern).hasMatch(input);
}
bool passwordValidation(input) {
  String pattern = r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$";
  return RegExp(pattern).hasMatch(input);
}
