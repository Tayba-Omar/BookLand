import 'package:flutter/material.dart';
import 'package:newfinalproject/Style/Color.dart';

class Author {
  final String name;
  final String info;
  final String path;
  final String bookNum;

  Author({
    required this.name,
    required this.info,
    required this.path,
    required this.bookNum,
  });
}

class Authorcontainer extends StatefulWidget {
  final Author author;
  const Authorcontainer({ required this.author});

  @override
  State<Authorcontainer> createState() => _AuthorcontainerState();
}

class _AuthorcontainerState extends State<Authorcontainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: txtMainColor, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Row(
            children: [

              Container(
                width: 100,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(widget.author.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
               SizedBox(width: 10),


              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.author.name,
                      style:  TextStyle(
                        fontSize: 30,
                        color: txtMainColor,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                     SizedBox(height: 5),
                    Text(
                      widget.author.bookNum,
                      style:  TextStyle(
                        fontSize: 22,
                        color: txtMainColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),

                  ],
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
