import 'package:flutter/material.dart';
import 'package:newfinalproject/Customize/BookContainer.dart';
import 'package:newfinalproject/Customize/Quotescontaner.dart';
import 'package:newfinalproject/Customize/ScreenClass.dart';
import 'package:newfinalproject/Screen/AuthorScreen.dart';
import 'package:newfinalproject/Screen/LibraryScreen.dart';
import 'package:newfinalproject/Screen/ListScreen.dart';
import 'package:newfinalproject/Screen/SavedScreen.dart';
import 'package:newfinalproject/Style/Color.dart';



class HomePage extends StatefulWidget {
  final String userName;
  final String password;

  HomePage({required this.userName, required this.password});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TextEditingController _searchController = TextEditingController();
  //List<Book> filteredBooks = [];
  final List<Book> books = [
    Book(path: "assets/images/poli2.webp", name: "the social contract", author: " Jean-Jacques Rousseau"),
    Book(path: "assets/images/poli3.webp", name: "Zionism", author: "Najib Nassar "),
    Book(path: "assets/images/poli4.webp", name: "Harun al-Rashid", author: "Ahmed Amin"),
    Book(path: "assets/images/phil1.webp", name: "Emotions of the\nsoul", author: "René Descartes "),
    Book(path: "assets/images/phil2.webp", name: "Thus Spoke Zarathustra", author: "Friedrich Nietzsche"),
    Book(path: "assets/images/phil3.png", name: "The Prophet", author: "Gibran Khalil Gibran"),
  ];

  @override
  // void initState() {
  //   super.initState();
  //   filteredBooks = books;
  //   _searchController.addListener(() {
  //     _filterBooks(_searchController.text);
  //   });
  // }
  //
  // void _filterBooks(String query) {
  //   setState(() {
  //     filteredBooks = books.where((book) {
  //       return book.name.toLowerCase().contains(query.toLowerCase());
  //     }).toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 6,
        backgroundColor: mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Row(
          children: [
            SizedBox(width: 15),
            Text(
              "BookLand",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: txtMainColor,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: txtColor, size: 35),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
            preferredSize: Size(0, 12),
            child:Text("")
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          //   child: Container(
          //     height: 40,
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(30),
          //     ),
          //     child: TextField(
          //      // controller: _searchController,
          //       decoration: InputDecoration(
          //         hintText: "Search for books...",
          //         prefixIcon: Icon(Icons.search, color: txtMainColor, size: 30),
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(30),
          //           borderSide: BorderSide.none,
          //         ),
          //         filled: true,
          //         fillColor: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top:5.0,left: 16,right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Screen(path: 'assets/images/book01.jpg', name: "Library", onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Library(),
                  ));
                }),

                Screen(path: 'assets/images/p6.jpg', name: "Author", onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Authorscreen(),
                  ));
                }),

                Screen(path: 'assets/images/p3.jpg', name: "List", onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Listscreen(),
                  ));
                }),

                Screen(path: 'assets/images/save03.png', name: "Saved", onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => FavoritesScreen(books: books),
                  ));
                }),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: SingleChildScrollView(
                scrollDirection:  Axis.horizontal,
                child: Row(
                  children: [
                    Quotescontaner(quotes: "\"  Push yourself, because no one else is going to do it for you..  \" "),
                    Quotescontaner(quotes: "\"  A negative mind will never give you a positive life..  \" "),
                    Quotescontaner(quotes: "\"  Don't let your fear decide your future.  \" "),
                    Quotescontaner(quotes: "\"  Study now, be proud later..  \" "),
                    Quotescontaner(quotes: "\"  Don't be afraid to fail, be afraid not to try..  \" "),
                    Quotescontaner(quotes: "\"  If you can dream it, you can do it..  \" "),
                    Quotescontaner(quotes: "\"  Take the risk or lose the chance.. \" "),
                    Quotescontaner(quotes: "\"  Stop stopping yourself..  \" "),
                    Quotescontaner(quotes: "\"  Your only LIMIT is your MIND..   \" "),
                    Quotescontaner(quotes: "\"  It's time to write a new story..  \" "),
                    Quotescontaner(quotes: "\" The time will pass anyway. \n  GO START NOW.. \" "),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended Books",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: txtMainColor),
                ),
              ],
            ),
            SizedBox(height: 10),
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
      ),
    );
  }
}