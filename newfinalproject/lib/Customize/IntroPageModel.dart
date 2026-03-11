import 'package:newfinalproject/Customize/IntroPageData.dart' show PageData;
import 'package:newfinalproject/Style/Color.dart';
import 'package:flutter/material.dart';



class PageModel extends StatelessWidget {
  final PageData page;
  const PageModel ({ super.key , required this.page}) ;
  @override

  Widget build(BuildContext context) {
    final screenHeight =MediaQuery.of(context).size.height;
    space (double p) => SizedBox(
      height: screenHeight* p /100,);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 6.0,top: 30),
          child: Row(
            children: [
              Text("The place where you can",
                  style: TextStyle(
                      fontSize: screenHeight*.041,
                      color: txtMainColor,
                    fontWeight: FontWeight.bold
              )
              )
            ],
          ),
        ),
        Container(
          width: 400,
          height: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(
              page.image.toString(),),
              fit: BoxFit.fill),
          ),
        ),
        Textt(
          page:page,
          style: TextStyle(
            fontSize: screenHeight*.075,
            color: txtMainColor,
            fontWeight: FontWeight.bold,
          )
        ),
      ],
    );
  }
}









class Textt extends StatelessWidget {
  final PageData page;
  final TextStyle style;
  const Textt({super.key , required this.page, required this.style});
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[ Text(page.title.toString(),
      style: style,),]
    );
  }
}

