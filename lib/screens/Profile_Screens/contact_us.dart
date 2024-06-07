import 'dart:convert';
import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;

class ContactUs extends StatefulWidget {
  final String value;
  ContactUs(this.value, {Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  var id;
  TextEditingController massageController = TextEditingController();
  var name = FirebaseAuth.instance.currentUser!.displayName;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    massageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 224, 221, 221),
            appBar: AppBar(
              leading: IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                  ),
                  onPressed: () {
                    Navigator.pop(context, true);
                  }),
              backgroundColor: const Color.fromARGB(255, 8, 52, 121),
              centerTitle: true,
              title: const Text("Contact Us"),
            ),
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
                    child: Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 30,
                            bottom: MediaQuery.of(context).size.height / 55,
                            left: MediaQuery.of(context).size.width / 15,
                            right: MediaQuery.of(context).size.width / 15),
                        child: Form(
                            key: _formKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          50,
                                    ),
                                    child: const Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("Name")),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          85,
                                      bottom:
                                          MediaQuery.of(context).size.height /
                                              55,
                                    ),
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height /
                                                80,
                                        bottom:
                                            MediaQuery.of(context).size.height /
                                                55,
                                        left:
                                            MediaQuery.of(context).size.width /
                                                30,
                                        right:
                                            MediaQuery.of(context).size.width /
                                                35),
                                    width:
                                        MediaQuery.of(context).size.width / 0,
                                    height:
                                        MediaQuery.of(context).size.height / 15,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                    ),
                                    child: Text("$name",
                                        style: const TextStyle(
                                          fontSize: 16,
                                        )),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                50,
                                      ),
                                      child: const Align(
                                          alignment: Alignment.topLeft,
                                          child: Text("Massage"))),
                                  Container(
                                      constraints: const BoxConstraints(
                                        maxHeight: double.infinity,
                                        minHeight: 60,
                                      ),
                                      margin: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height /
                                                85,
                                        bottom:
                                            MediaQuery.of(context).size.height /
                                                25,
                                      ),
                                      child: TextFormField(
                                        controller: massageController,
                                        minLines: 2,
                                        maxLines: 4,
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: const Color.fromARGB(
                                                255, 230, 224, 224),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      )),
                                  GestureDetector(
                                      onTap: () => Save(),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              16,
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 0, 40, 104),
                                                  Color.fromARGB(
                                                      255, 166, 5, 230)
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment(1.4, 1),
                                                tileMode: TileMode.mirror),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                'SEND',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ))))
                                ])))))));
  }

  Future<void> Save() async {
    if (widget.value != null && massageController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse("https://panel.speakify.co.in/webservices/contact_us"),
          headers: {
            "SPEAKIFY-API-KEY": "25ab96eb73074ed4ecaaa3ec09c1b5f5c482966f"
          },
          body: ({
            "user_id": widget.value,
            "message": massageController.text,
          }));
      print("ter" + response.body.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        var res = json.decode(response.body);

        if (res['status'] == "1") {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Message Sent Successfully')));
        }
      }
    }
  }
}
