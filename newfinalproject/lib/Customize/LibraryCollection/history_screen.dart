import 'package:flutter/material.dart';
import 'package:newfinalproject/Customize/BookContainer.dart';
import 'package:newfinalproject/Style/Color.dart';
import 'NavigateFun.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        backgroundColor: mainColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 25,color: txtMainColor,),
        ),
        title: const Text(
          "Library",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: txtMainColor),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  for (var category in [
                    "All", "Poetry", "History", "Literature",
                    "Novels", "Religious", "Short Stories", "Philosophy",
                    "Political", "Academic Books"
                  ])
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: TextButton(
                        onPressed: () => navigateToScreen(context, category),
                        style: TextButton.styleFrom(
                          backgroundColor: category == "History" ? lightOrange : txtColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          category,
                          style: const TextStyle(fontSize: 18,color: txtMainColor),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
