import 'package:flutter/material.dart';
import 'package:newfinalproject/Screen/IntroScreen.dart';
import 'package:newfinalproject/Style/Color.dart';




class Welcomescreen extends StatefulWidget {
  const Welcomescreen({super.key});

  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,

      body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0,bottom: 50),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 400,
                      width:MediaQuery.of(context).size.width,
                      child:
                      Image.asset(
                        'assets/images/intro.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text("BookLand ",style: TextStyle(
                        fontSize:60,
                        color: txtMainColor,
                        fontWeight: FontWeight.bold
                    )
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (_)=>Introscreen() ));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: txtColor
                        ) ,
                        child: Text("Start your journey",
                          style: TextStyle(
                              color: txtMainColor,
                              fontSize: 25
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
            ),
          )
      ),
    );
  }
}

