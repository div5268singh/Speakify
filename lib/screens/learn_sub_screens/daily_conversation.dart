import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

class DailyConversation extends StatefulWidget {
  const DailyConversation({Key? key}) : super(key: key);

  @override
  State<DailyConversation> createState() => _DailyConversationState();
}

class _DailyConversationState extends State<DailyConversation> {
  List<dynamic> stateList_daily_conversation = [];
  @override
  Widget build(BuildContext context) {
    daily_conversation()
        .then((value) => stateList_daily_conversation.addAll(value));
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
                },
              ),
              backgroundColor: const Color.fromARGB(255, 3, 47, 117),
              centerTitle: true,
              title: const Text("Daily Conversation"),
            ),
            body: ListView.builder(
              itemBuilder: (context, index) {
                // var _pressGeoON = "${stateList_daily_conversation[index]}";
                return Card(
                  child: Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 40,
                        left: MediaQuery.of(context).size.width / 20,
                      ),
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                child: Container(
                                    padding: EdgeInsets.only(
                                        right:
                                            MediaQuery.of(context).size.width /
                                                20),
                                    constraints: const BoxConstraints(
                                      maxHeight: double.infinity,
                                      minHeight: 60,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${stateList_daily_conversation[index]["head_text"]}",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ))),
                            Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                        onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: Html(
                                data: stateList_daily_conversation[index]
                                    ["body_text"],
                              ));
                            }),
                      ),
                    ),
                  ]),
                );
              },
              itemCount: stateList_daily_conversation.length,
            )));
  }

  Future<List<dynamic>> daily_conversation() async {
    var response = await http.get(
        Uri.parse(
            'https://panel.speakify.co.in/webservices/daily_conversation'),
        headers: {
          'SPEAKIFY-API-KEY': '25ab96eb73074ed4ecaaa3ec09c1b5f5c482966f',
        });
    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      setState(() {
        if (res['status'] == "1") {
          stateList_daily_conversation = res['data'] as List;
          print("${stateList_daily_conversation}");
          print("hi ${stateList_daily_conversation}");
        }
      });
    }
    return stateList_daily_conversation;
  }
}
