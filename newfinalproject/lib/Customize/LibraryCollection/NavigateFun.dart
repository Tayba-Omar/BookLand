import 'package:flutter/material.dart';
import 'package:newfinalproject/Customize/BookContainer.dart';
import 'package:newfinalproject/Customize/LibraryCollection/academic_books_screen.dart';
import 'package:newfinalproject/Customize/LibraryCollection/history_screen.dart';
import 'package:newfinalproject/Customize/LibraryCollection/literature_screen.dart';
import 'package:newfinalproject/Customize/LibraryCollection/novels_screen.dart';
import 'package:newfinalproject/Customize/LibraryCollection/philosophy_screen.dart';
import 'package:newfinalproject/Customize/LibraryCollection/poetry_screen.dart';
import 'package:newfinalproject/Customize/LibraryCollection/political_screen.dart';
import 'package:newfinalproject/Customize/LibraryCollection/religious_screen.dart';
import 'package:newfinalproject/Customize/LibraryCollection/short_stories_screen.dart';
import 'package:newfinalproject/Screen/LibraryScreen.dart';
import 'package:newfinalproject/Style/Color.dart';
import 'NavigateFun.dart';

void navigateToScreen(BuildContext context, String category) {
  Widget screen;
  switch (category) {
    // case "Fiction":
    //   screen = Fictionscreen();
    //   break;
    case "Poetry":
      screen = PoetryScreen();
      break;
    case "History":
      screen = HistoryScreen();
      break;
    case "Literature":
      screen = LiteratureScreen();
      break;
    case "Novels":
      screen = NovelsScreen();
      break;
    case "Religious":
      screen = ReligiousScreen();
      break;
    case "Short Stories":
      screen = ShortstoriesScreen();
      break;
    case "Philosophy":
      screen = PhilosophyScreen();
      break;
    case "Political":
      screen = PoliticalScreen();
      break;
    case "Academic Books":
      screen = AcademicBooksScreen();
      break;
    case "All":
      screen = Library();
      break;
    default:
      return;
  }


  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}
