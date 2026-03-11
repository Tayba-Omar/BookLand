import 'package:flutter/material.dart';
import 'package:newfinalproject/Customize/ForAuthor/AuthorContainer.dart';
import 'package:newfinalproject/Style/Color.dart';

class Authorscreen extends StatefulWidget {
  const Authorscreen({super.key});

  @override
  State<Authorscreen> createState() => _AuthorscreenState();
}

class _AuthorscreenState extends State<Authorscreen> {
  final List<Author> Authors = [
    Author(name: "Kamel Kilani", info: " was an Egyptian writer and translator, widely regarded as a pioneer of children's literature in the Arab world.",
        path: "assets/images/Author/AU01.jpeg", bookNum: " over 200 stories"),
    
    Author(name: "Gibran Khalil Gibran", info: " (also spelled Kahlil Gibran) was a Lebanese-American writer, poet, philosopher, and artist, best known for his book The Prophet (1923), a collection of poetic essays that became one of the most translated and best-selling books of all time.",
        path: "assets/images/Author/AU02.jpeg", bookNum: "over 30 books "),
    
    Author(name: "Abbas Mahmoud Al-Akkad", info: " was a towering figure in modern Arabic literature and thought. Born in 1889 in Aswan, Egypt, he was largely self-educated and went on to become a prolific writer, poet, philosopher, and journalist. His works covered a wide range of subjects, including history, politics, philosophy, and science, with a particular focus on biography and literary criticism.",
        path: "assets/images/Author/AU03.png", bookNum: "over 100 books"),
    
    Author(name: "Naguib Mahfouz", info: "was an Egyptian writer, best known for his profound and influential contributions to Arabic literature. He won the Nobel Prize in Literature in 1988, making him the first Arab writer to receive the prestigious award. His works have been translated into many languages and have earned him global recognition."
        , path: "assets/images/Author/AU04.jpeg", bookNum: "over 30 novels")

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
          "Author",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: txtMainColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Authors.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          title: Text(Authors[index].name,style: TextStyle(color: txtMainColor, fontWeight: FontWeight.bold),),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(Authors[index].path, height: 150),
                              SizedBox(height: 10),
                              RichText(
                                text: TextSpan(
                                  style:  TextStyle(fontSize: 22, color: txtMainColor),
                                  children: [
                                    TextSpan(
                                      text: "published ",
                                      style: TextStyle(fontSize: 25,
                                        fontWeight: FontWeight.bold,),
                                    ),
                                    TextSpan(text: Authors[index].bookNum),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(fontSize: 20, color: txtMainColor),
                                  children: [
                                    TextSpan(
                                      text: "Information: ",
                                      style: TextStyle(fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text:Authors[index].info

                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Close",style: TextStyle(
                                fontSize: 20,
                                  color: mainColor,fontWeight: FontWeight.bold),),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Authorcontainer(author: Authors[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
