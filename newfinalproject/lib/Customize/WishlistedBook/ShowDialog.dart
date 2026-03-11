import 'package:flutter/material.dart';

import '../../Style/Color.dart';

class ShowdialogClass extends StatefulWidget {
  TextEditingController addTaskController ;
  Function fun;
  ShowdialogClass({required this.addTaskController,required this.fun});

  @override
  State<ShowdialogClass> createState() => _ShowdialogClassState();
}

class _ShowdialogClassState extends State<ShowdialogClass> {
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: lightOrange,
      title: Text("Add Book Name",style:TextStyle(
          color: txtMainColor,
        fontSize: 30,
      )),
      content: TextField(
        controller: widget.addTaskController,
      ),
      actions: [
        TextButton(onPressed: () {
          setState(() {
            widget.fun();
          });

          Navigator.pop(context);
        }, child: Text("Add",style:TextStyle(
          color: txtColor,
          fontSize: 25,

        ),)),
        TextButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text("Cancel",style:TextStyle(
            color: txtColor,
          fontSize: 25,

        ))),

      ],


    );
  }
}