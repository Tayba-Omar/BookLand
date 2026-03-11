import 'package:flutter/material.dart';
import 'package:newfinalproject/Customize/BookContainer.dart';
import 'package:newfinalproject/Style/Color.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Book> books;

  FavoritesScreen({required this.books});

  List<Book> getFavoriteBooks(List<Book> allBooks) {
    return allBooks.where((book) => book.isFavorite).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Book> favList = getFavoriteBooks(books);

    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        backgroundColor: mainColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: txtColor, size: 25),
        ),
        title: const Text(
          "Saved Book",
          style: TextStyle(fontSize: 40, color: txtMainColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: favList.isEmpty
          ? const Center(
        child: Text(
          'No saved books.',
          style: TextStyle(fontSize: 25, color: txtMainColor),
        ),
      )
          : ListView.builder(
        itemCount: favList.length,
        itemBuilder: (context, index) {
          Book book = favList[index];
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    title: Text(
                      book.name,
                      style:  TextStyle(color: txtMainColor, fontWeight: FontWeight.bold),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(book.path, height: 150),
                         SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            style:  TextStyle(fontSize: 16, color: txtMainColor),
                            children: [
                               TextSpan(
                                text: "Author: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: book.author),
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
                                text: "More book info here.",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child:  Text(
                          "Close",
                          style: TextStyle(color: mainColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: BookContainer(book: book),
          );
        },
      ),
    );
  }
}
