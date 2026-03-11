import 'package:flutter/material.dart';
import 'package:newfinalproject/Customize/TextFormFiled.dart';
import 'package:newfinalproject/Screen/HomeScreen.dart';
import 'package:newfinalproject/Style/Color.dart';
import 'package:lottie/lottie.dart';


class CreatProfile extends StatefulWidget {
  const CreatProfile({super.key});

  @override
  State<CreatProfile> createState() => _CreatProfileState();
}

class _CreatProfileState extends State<CreatProfile> {
  String name = "USER";
  String pass = "***";

  final _formKey = GlobalKey<FormState>(); // Single Form key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(150),
          ),
        ),
        backgroundColor: mainColor,
        bottom: PreferredSize(preferredSize: Size(0, 141), child: Text("")
        ),
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 20.0,left: 30,right: 30,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 200,
                child: Lottie.network(
                    'https://lottie.host/45f407e0-2d50-4c29-8a29-c232eb9362b5/ZpF5BweTAJ.json'
                ),
              ),
            //  SizedBox(height: 40),
              Text("Create Profile",
                style: TextStyle(fontSize: 40,
                    color: txtMainColor,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Textformfiled(
                      lbl: "Username",
                      toCheck: (check) {
                        if (!(uesrNameValidation(check))) {
                          return "Not valid";
                        }
                        name = check!;
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Textformfiled(
                      lbl: "Password",
                      toCheck: (check) {
                        if (!(passwordValidation(check))) {
                          return "Not valid";
                        }
                        pass = check!;
                        return null; // Valid input
                      },
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                             Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => HomePage(userName: name,password:pass)
                             )
                             );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: txtMainColor,
                        ),
                        child: Text("Next", style: TextStyle(color: lightOrange,
                            fontSize: 20)
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
