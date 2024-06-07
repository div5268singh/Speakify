import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:speakify/screens/login.dart';
import 'package:speakify/screens/navigation/navigation.dart';

class Sign_Email extends StatefulWidget {
  const Sign_Email({Key? key}) : super(key: key);

  @override
  State<Sign_Email> createState() => _Sign_EmailState();
}

// ignore: camel_case_types
class _Sign_EmailState extends State<Sign_Email> {
  int _value = 2;
  bool _isVisible = false;
  String email = FirebaseAuth.instance.currentUser?.email ?? "";
  String number = FirebaseAuth.instance.currentUser?.phoneNumber ?? "";
  var name = FirebaseAuth.instance.currentUser?.displayName;
  // ignore: non_constant_identifier_names
  bool is_Loding = false;
  @override
  void initState() {
    super.initState();
    validateAndSave();
    Save();
  }

  late SharedPreferences loginData;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 234, 245, 250),
            body: GestureDetector(
                onPanDown: (details) {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.height / 3.5,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 3, 47, 117),
                            Color.fromARGB(255, 166, 5, 230)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment(1.4, 1),
                          tileMode: TileMode.mirror),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(120)),
                    ),
                    child: Stack(children: [
                      GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const Login())),
                          child: Container(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 50,
                                top: MediaQuery.of(context).size.height / 17),
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.height / 25,
                            ),
                          )),
                      Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 35,
                              top: MediaQuery.of(context).size.height / 5.5),
                          child: Text(
                            "What is Your Gender?",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width / 13),
                          ))
                    ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 20,
                        right: MediaQuery.of(context).size.width / 20,
                        top: MediaQuery.of(context).size.width / 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() {
                            _value = 0;
                            _isVisible = true;
                            print("8");
                          }),
                          child: Container(
                              height: MediaQuery.of(context).size.height / 4.5,
                              width: MediaQuery.of(context).size.width / 2.5,
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 15,
                                right: MediaQuery.of(context).size.width / 15,
                                top: MediaQuery.of(context).size.width / 15,
                              ),
                              color: _value == 0
                                  ? const Color.fromARGB(255, 3, 47, 117)
                                  : const Color.fromARGB(255, 244, 239, 239),
                              child: Column(children: [
                                Image.asset(
                                  "assets/images/male.png",
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 50,
                                ),
                                Text("Male",
                                    style: TextStyle(
                                      color: _value == 0
                                          ? Colors.white
                                          : Colors.black,
                                    )),
                              ])),
                        ),
                        GestureDetector(
                          onTap: () => setState(() {
                            _value = 1;
                            _isVisible = true;
                            print("7");
                          }),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 4.5,
                            width: MediaQuery.of(context).size.width / 2.5,
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 15,
                              right: MediaQuery.of(context).size.width / 15,
                              top: MediaQuery.of(context).size.width / 15,
                            ),
                            color: _value == 1
                                ? Color.fromARGB(255, 3, 47, 117)
                                : Color.fromARGB(255, 244, 239, 239),
                            child: Column(children: [
                              Image.asset(
                                "assets/images/female.png",
                                // width: MediaQuery.of(context).size.width / 18,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 50,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                  color:
                                      _value == 1 ? Colors.white : Colors.black,
                                ),
                              )
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  GestureDetector(
                      onTap: () {
                        Save();
                        print("9");
                      },
                      child: Visibility(
                          visible: _isVisible,
                          child: Container(
                              width: MediaQuery.of(context).size.width / 1,
                              height: MediaQuery.of(context).size.height / 16,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 3, 47, 117),
                                      Color.fromARGB(255, 166, 5, 230)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment(1.4, 1),
                                    tileMode: TileMode.mirror),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'CONTINUE',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )))),
                ]))));
  }

  Future<void> Save() async {
    print("object");
    loginData = await SharedPreferences.getInstance();
    if (_value != 2 && email.isNotEmpty) {
      var response = await http.post(
          Uri.parse("https://panel.speakify.co.in/webservices/signup"),
          headers: {
            "SPEAKIFY-API-KEY": "25ab96eb73074ed4ecaaa3ec09c1b5f5c482966f"
          },
          body: ({"name": name, "email": email, "gender": _value.toString()}));
      print("ter" + response.body.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.statusCode);
        var res = json.decode(response.body);
        print("object" + res.toString());

        if (res['status'] == "1") {
          var data = res['user_data'];
          print("data " + data['id'].toString());
          loginData.setString("id", data['id'].toString());

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => Nav()));
        }
      }
    }
  }

  Future<void> validateAndSave() async {
    if (email.isNotEmpty || number.isNotEmpty) {
      var response = await http.post(
          Uri.parse("https://panel.speakify.co.in/webservices/login"),
          headers: {
            "SPEAKIFY-API-KEY": "25ab96eb73074ed4ecaaa3ec09c1b5f5c482966f"
          },
          body: ({
            "email": email,
            "mobile": number,
          }));
      if (response.statusCode == 200) {
        print("10");
        var res = json.decode(response.body);
        if (res['status'] == "1") {
          print("11");
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text('Login  Successfully')));
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => Nav()));
        }
      }
    }
  }
}
