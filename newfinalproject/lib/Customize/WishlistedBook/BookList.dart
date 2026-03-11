import 'package:flutter/material.dart';
import 'package:newfinalproject/Style/Color.dart';


class Cardtask extends StatefulWidget {
  String taskTitle;
  bool isCheck ;
  Function changeFun;
  int index;
  Function delete;
  Cardtask({required this.taskTitle , required this.isCheck , required this.changeFun,required this.index,required this.delete});

  @override
  State<Cardtask> createState() => _CardtaskState();
}

class _CardtaskState extends State<Cardtask> {

  @override

  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell( onLongPress: (){
        widget.delete(widget.index);

      },
        child: Container(
          height: 100,

          child: Card(
            color: lightGreen,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.taskTitle,
                    style: TextStyle(
                        decoration: widget.isCheck ? TextDecoration.lineThrough : null,
                        decorationThickness: 4,
                        color: txtMainColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: InkWell(child: widget.isCheck?
                        Icon(Icons.check,color: txtMainColor,):
                        Icon(Icons.circle_outlined,color: txtMainColor,),

                          onTap: (){
                            widget.changeFun(widget.index);
                          },),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}