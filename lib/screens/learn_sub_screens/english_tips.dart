import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EnglishTips extends StatefulWidget {
  const EnglishTips({Key? key}) : super(key: key);

  @override
  State<EnglishTips> createState() => _EnglishTipsState();
}

class _EnglishTipsState extends State<EnglishTips> {
  List<dynamic> stateList_english = [];
  @override
  Widget build(BuildContext context) {
    english().then((value) => stateList_english.addAll(value));
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
              backgroundColor: const Color.fromARGB(255, 3, 47, 117),
              centerTitle: true,
              title: const Text("English Tips"),
            ),
            body: ListView.builder(
              itemBuilder: (context, index) {
                var _pressGeoON = "${stateList_english[index]}";
                return Card(
                  child: Column(children: <Widget>[
                    Row(
                      children: [
                        Flexible(
                            child: Container(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 20,
                                    right:
                                        MediaQuery.of(context).size.width / 20),
                                constraints: const BoxConstraints(
                                  maxHeight: double.infinity,
                                  minHeight: 60,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "${stateList_english[index]["simple_text"]}",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Html(
                                        data: stateList_english[index]
                                            ["eng_para"])
                                    // Text(
                                    //     """${stateList_english[index]["eng_para"]}""")
                                  ],
                                ))),
                      ],
                    ),
                  ]),
                );
              },
              itemCount: stateList_english.length,
            )));
    ;
  }

  Future<List<dynamic>> english() async {
    var response = await http.get(
        Uri.parse('https://panel.speakify.co.in/webservices/english_tips'),
        headers: {
          'SPEAKIFY-API-KEY': '25ab96eb73074ed4ecaaa3ec09c1b5f5c482966f',
        });
    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      setState(() {
        if (res['status'] == "1") {
          stateList_english = res['data'] as List;
          print("${stateList_english}");
          print("hi ${stateList_english}");
        }
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Somthing Went Wrong')));
    }
    return stateList_english;
  }
}
