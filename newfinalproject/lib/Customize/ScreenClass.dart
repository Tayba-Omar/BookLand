import 'package:newfinalproject/Style/Color.dart';
import 'package:flutter/material.dart';


class Screen extends StatefulWidget {
  final String path;
  final String name;
  final Function() onPressed;

  Screen({required this.path,required this.name, required this.onPressed});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: widget.onPressed,
      child: Container(
        child: Column(
          children: [
            Container(
              width: 60,
              height:60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(widget.path),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // SizedBox(
            //   height: 3,
            // ),
            Text(widget.name,
              style: TextStyle(fontSize: 18, color: txtMainColor,fontWeight: FontWeight.bold)
            )
          ],
        ),

      ),
    );
  }
}
