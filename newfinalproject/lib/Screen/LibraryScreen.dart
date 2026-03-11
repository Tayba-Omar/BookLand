import 'package:flutter/material.dart';
import 'package:newfinalproject/Customize/BookContainer.dart';
import 'package:newfinalproject/Customize/LibraryCollection/NavigateFun.dart';
import 'package:newfinalproject/Style/Color.dart';





class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  final List<Book> books = [

    Book(path: "assets/images/aca3.jpg", name: "Introduction to Algorithms", author: "Thomas H.Cormen"),
    Book(path: "assets/images/aca4.jpg", name: "Clean Code", author: "Robert C.Martin"),
    Book(path: "assets/images/poli1.webp", name: "Arab civilization", author: "Gustave Le Bon"),
    Book(path: "assets/images/poli2.webp", name: "the social contract", author: " Jean-Jacques Rousseau"),
    Book(path: "assets/images/poli3.webp", name: "Zionism", author: "Najib Nassar "),
    Book(path: "assets/images/poli4.webp", name: "Harun al-Rashid", author: "Ahmed Amin"),
    Book(path: "assets/images/phil1.webp", name: "Emotions of the\nsoul", author: "René Descartes "),
    Book(path: "assets/images/phil2.webp", name: "Thus Spoke Zarathustra", author: "Friedrich Nietzsche"),
    Book(path: "assets/images/phil3.png", name: "The Prophet", author: "Gibran Khalil Gibran"),
    Book(path: "assets/images/phil4.png", name: "Quranic philosophy", author: "Abbas Mahmoud Al-Akkad"),
    Book(path: "assets/images/b1.jpeg", name: "Harry Potter", author: "J.K. Rowling"),
    Book(path: "assets/images/b2.jpeg", name: "The Silent Patient", author: "Alex Michaelides"),
    Book(path: "assets/images/b3.jpeg", name: "Atomic Habits", author: "James Clear"),
    Book(path: "assets/images/b4.jpeg", name: "The Power of Now", author: "Eckhart Tolle"),
    Book(path: "assets/images/b6.jpg", name: "How to Be Happy", author: "Anna Barnes"),
    Book(path: "assets/images/b7.jpg", name: "Think & Grow Rich", author: "Napoleon Hill"),
    Book(path: "assets/images/aca1.jpg", name: "Physiology", author: "Linda S.Costanzo"),
    Book(path: "assets/images/aca2.jpeg", name: "Bates", author: "Lynn S.Bickley"),
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
                          backgroundColor: category == "All" ? lightOrange : txtColor,
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
