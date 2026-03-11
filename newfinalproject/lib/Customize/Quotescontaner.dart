import 'package:flutter/material.dart';
import 'package:newfinalproject/Style/Color.dart';

class Quotescontaner extends StatelessWidget {
  final String quotes;
  Quotescontaner({ required this.quotes});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 5,right: 5),
      child: Container(
          width: 280,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: lightGreen,
          ),
          child:
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(quotes,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: txtMainColor
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }
}
