import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speakify/screens/navigation/navigation.dart';

class Sign_up_no extends StatefulWidget {
  final String phoneno;
  const Sign_up_no(this.phoneno, {Key? key}) : super(key: key);

  @override
  State<Sign_up_no> createState() => _Sign_up_noState();
}

class _Sign_up_noState extends State<Sign_up_no> {
  FocusNode myFocusNode = new FocusNode();
  TextEditingController nameController = TextEditingController();
  TextEditingController noController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String dropdownvalue = 'Please select Gender ';
  int id = 4;

// List of items in our dropdown menu
  var items = [
    'Please select Gender ',
    'Male',
    'Female',
  ];

  late SharedPreferences loginData;
  @override
  Widget build(BuildContext context) {
    var phone_number = widget.phoneno;
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
              child: SingleChildScrollView(
                  child: Form(
                      key: _formKey,
                      child: Column(children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1,
                          height: MediaQuery.of(context).size.height / 4.5,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 3, 47, 117),
                                  Color.fromARGB(255, 166, 5, 230)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment(1.4, 1),
                                tileMode: TileMode.mirror),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(120)),
                          ),
                          child: Stack(children: [
                            Container(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 15,
                                    top: MediaQuery.of(context).size.height /
                                        17),
                                child: Text(
                                  "Speakify",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              15),
                                )),
                            Container(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 15,
                                    top: MediaQuery.of(context).size.height /
                                        7.5),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              11),
                                ))
                          ]),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 8,
                                // bottom: MediaQuery.of(context).size.height / 25,
                                left: MediaQuery.of(context).size.width / 15,
                                right: MediaQuery.of(context).size.width / 15),
                            child: TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                  labelText: "Name",
                                  floatingLabelStyle: TextStyle(
                                      color: Color.fromARGB(255, 100, 37, 162)),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 255, 252, 252),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color.fromARGB(255, 100, 37, 162)),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            )),
                        Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 25,
                                left: MediaQuery.of(context).size.width / 15,
                                right: MediaQuery.of(context).size.width / 15),
                            child: TextFormField(
                              autofocus: false,
                              decoration: InputDecoration(
                                  hintText: "${phone_number}",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  labelText: "Mobile Number",
                                  floatingLabelStyle: TextStyle(
                                      color: Color.fromARGB(255, 100, 37, 162)),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 255, 252, 252),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color.fromARGB(255, 100, 37, 162)),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 252, 252),
                            border: Border.all(color: Colors.black38, width: 1),
                          ),
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 15,
                              right: MediaQuery.of(context).size.width / 15),
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 25,
                            // left: MediaQuery.of(context).size.width / 15,
                            // right: MediaQuery.of(context).size.width / 15
                          ),
                          child: DropdownButton(
                            value: dropdownvalue,
                            // elevation: 5,
                            // iconDisabledColor: Colors.white,
                            iconEnabledColor: Colors.white,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                            ),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                                print(
                                    "kcvlj ${dropdownvalue.characters.length}");
                                if (dropdownvalue.characters.length == 4) {
                                  setState(() {
                                    id = 0;
                                    print(id);
                                  });
                                }
                                if (dropdownvalue.characters.length == 6) {
                                  setState(() {
                                    id = 1;
                                    print(id);
                                  });
                                }
                                if (dropdownvalue.characters.length == 21) {
                                  setState(() {
                                    id = 2;
                                    print("djkhj$id");
                                  });
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 25,
                          ),
                          child: GestureDetector(
                              onTap: () {
                                Save();
                                print("9");
                              },
                              child: Visibility(
                                  //visible: _isVisible,
                                  child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 1,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              16,
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
                        )
                      ])))),
        ));
  }

  Future<void> Save() async {
    // print("object");
    print(id);
    // print(widget.phoneno);
    var phone_number = widget.phoneno;
    loginData = await SharedPreferences.getInstance();
    if (id != 2 && nameController.text.isNotEmpty) {
      print(id);
      var response = await http.post(
          Uri.parse("https://panel.speakify.co.in/webservices/signup"),
          headers: {
            "SPEAKIFY-API-KEY": "25ab96eb73074ed4ecaaa3ec09c1b5f5c482966f"
          },
          body: ({
            "name": "hdsjkghh",
            "mobile": phone_number,
            "gender": id.toString()
          }));
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
}
