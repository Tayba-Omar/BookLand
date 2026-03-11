import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newfinalproject/Customize/WishlistedBook/BookList.dart';
import 'package:newfinalproject/Customize/WishlistedBook/ShowDialog.dart';
import 'package:newfinalproject/Style/Color.dart';


class Listscreen extends StatefulWidget {
  const Listscreen({super.key});

  @override
  State<Listscreen> createState() => _ListscreenState();
}

class _ListscreenState extends State<Listscreen> {
  TextEditingController addTaskController = TextEditingController();
  List<Task> allTask = [];

  onChangeStuats(int index) {
    setState(() {
      allTask[index].isDo = !allTask[index].isDo;
    });
  }

  deleteItem(int index){
    setState(() {
      allTask.remove(allTask[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4) ,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        backgroundColor: mainColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 25,color: txtColor,),
        ),
        title: const Text(
          "Wish-listed book",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: txtMainColor),
        ),
      ),
      body: SingleChildScrollView(
        child:
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/p2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),

            allTask.length == 0
                ? Center(
                  child: Text(
                    "         any time is a GOOD TIME\nto open a book and READ",
                    style: GoogleFonts.delius(fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: txtMainColor),

                  ),
                )
                : Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ...allTask
                    .map(
                      (item) => Cardtask(
                    taskTitle: item.task,
                    isCheck: item.isDo,
                    changeFun: onChangeStuats,
                    index: allTask.indexOf(item),
                    delete: deleteItem,
                  ),
                )
                    .toList(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return ShowdialogClass(
                addTaskController: addTaskController,
                fun: fun,
              );
            },
          );
        },
        child: Icon(Icons.add,color: txtColor,size: 40,),
        backgroundColor: mainColor,
      ),
    );
  }

  fun() {
    setState(() {
      allTask.add(Task(task: addTaskController.text, isDo: false));
    });
  }

}

class Task {
  String task;
  bool isDo;

  Task({required this.task, required this.isDo});
}