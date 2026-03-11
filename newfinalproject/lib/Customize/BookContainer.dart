import 'package:flutter/material.dart';
import 'package:newfinalproject/Style/Color.dart';

class Book {
  final String name;
  final String author;
  final String path;
  bool isFavorite;

  Book({
    required this.name,
    required this.author,
    required this.path,
    this.isFavorite = false,
  });
}

class BookContainer extends StatefulWidget {
  final Book book;

  BookContainer({required this.book});

  @override
  State<BookContainer> createState() => _BookContainerState();
}

class _BookContainerState extends State<BookContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: txtMainColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(widget.book.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),

              // Book Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.book.name,
                      style: TextStyle(
                        fontSize: 25,
                        color: txtMainColor,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.book.author,
                      style: TextStyle(
                        fontSize: 17,
                        color: txtMainColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // Favorite Icon
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.book.isFavorite = !widget.book.isFavorite;
                  });
                },
                icon: Icon(
                  Icons.bookmark,
                  size: 30,
                  color: widget.book.isFavorite ? txtMainColor : lightGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
