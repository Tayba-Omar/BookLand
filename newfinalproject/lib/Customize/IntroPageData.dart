import 'package:newfinalproject/Style/Color.dart';
import 'package:flutter/material.dart';
  
class PageData{
  final String? title;
  final String? image;
  final Color? txtColor;
  final Color? bgColor;

  PageData({
    required this.title,
    required this.image,
    this.txtColor=txtMainColor,
    this.bgColor=Colors.white,
          });

}