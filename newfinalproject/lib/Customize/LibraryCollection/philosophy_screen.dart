import 'package:flutter/material.dart';
import 'package:newfinalproject/Customize/BookContainer.dart';
import 'package:newfinalproject/Style/Color.dart';
import 'NavigateFun.dart';


class PhilosophyScreen extends StatefulWidget {
  const PhilosophyScreen({super.key});

  @override
  State<PhilosophyScreen> createState() => _PhilosophyScreenState();
}

class _PhilosophyScreenState extends State<PhilosophyScreen> {
  final List<Book> books = [
    Book(path: "assets/images/phil1.webp", name: "Emotions of the\nsoul", author: "René Descartes "),
    Book(path: "assets/images/phil2.webp", name: "Thus Spoke Zarathustra", author: "Friedrich Nietzsche"),
    Book(path: "assets/images/phil3.png", name: "The Prophet", author: "Gibran Khalil Gibran"),
    Book(path: "assets/images/phil4.png", name: "Quranic philosophy", author: "Abbas Mahmoud Al-Akkad"),

  ];
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
          icon: const Icon(Icons.arrow_back_ios, size: 25),
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
                    "All","Poetry", "History", "Literature",
                    "Novels", "Religious", "Short Stories", "Philosophy",
                    "Political", "Academic Books"
                  ])
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: TextButton(
                        onPressed: () => navigateToScreen(context, category),
                        style: TextButton.styleFrom(
                          backgroundColor: category == "Philosophy" ? lightOrange : txtColor,
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
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          title: Text(books[index].name,style: TextStyle(color: txtMainColor, fontWeight: FontWeight.bold),),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(books[index].path, height: 150),
                              SizedBox(height: 10),
                              RichText(
                                text: TextSpan(
                                  style:  TextStyle(fontSize: 16, color: txtMainColor),
                                  children: [
                                    TextSpan(
                                      text: "Author: ",
                                      style: TextStyle(fontWeight: FontWeight.bold,),
                                    ),
                                    TextSpan(text: books[index].author),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(fontSize: 16, color: txtMainColor),
                                  children: [
                                    TextSpan(
                                      text: "Description: ",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text:
                                      "more book info here.",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Close",style: TextStyle(color: mainColor,fontWeight: FontWeight.bold),),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: BookContainer(book: books[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
