import 'package:flutter/material.dart';
import 'package:speakify/screens/learn_sub_screens/basic_grammar_sub_screens/popular_ideams.dart';
import 'package:speakify/screens/learn_sub_screens/basic_grammar_sub_screens/speech.dart';
import 'package:speakify/screens/learn_sub_screens/basic_grammar_sub_screens/tense_overview.dart';

class BasicGrammer extends StatefulWidget {
  const BasicGrammer({Key? key}) : super(key: key);

  @override
  State<BasicGrammer> createState() => _BasicGrammerState();
}

class _BasicGrammerState extends State<BasicGrammer> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 242, 251, 255),
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_left,
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              backgroundColor: const Color.fromARGB(255, 3, 47, 117),
              centerTitle: true,
              title: const Text("Basic Grammar"),
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
                  child: Column(children: [
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 60),
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 13,
                          right: MediaQuery.of(context).size.width / 30,
                          bottom: MediaQuery.of(context).size.width / 30,
                          top: MediaQuery.of(context).size.width / 30,
                        ),
                        constraints: const BoxConstraints(
                          maxHeight: double.infinity,
                          minHeight: 60,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tense OverView",
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 17),
                              ),
                              Icon(Icons.keyboard_arrow_right)
                            ]),
                      ),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => Tense_Overview())),
                    ),
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 60),
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 13,
                          right: MediaQuery.of(context).size.width / 30,
                          bottom: MediaQuery.of(context).size.width / 30,
                          top: MediaQuery.of(context).size.width / 30,
                        ),
                        constraints: const BoxConstraints(
                          maxHeight: double.infinity,
                          minHeight: 60,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Speech",
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 17),
                              ),
                              Icon(Icons.keyboard_arrow_right)
                            ]),
                      ),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => Speech())),
                    ),
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 60),
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 13,
                          right: MediaQuery.of(context).size.width / 30,
                          bottom: MediaQuery.of(context).size.width / 30,
                          top: MediaQuery.of(context).size.width / 30,
                        ),
                        constraints: const BoxConstraints(
                          maxHeight: double.infinity,
                          minHeight: 60,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Popular Ideams",
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 17),
                              ),
                              Icon(Icons.keyboard_arrow_right)
                            ]),
                      ),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => Popular_ideams())),
                    ),
                  ]),
                ))));
  }
}
