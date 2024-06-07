import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Terms extends StatefulWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  List<dynamic> data = [];
  @override
  void initState() {
    super.initState();
    terms();
  }

  @override
  Widget build(BuildContext context) {
    terms().then((value) => data.addAll(value));
    return WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
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
            title: const Text("Terms & Condition"),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Column(children: <Widget>[
                  Row(
                    children: [
                      Flexible(
                          child: Container(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width / 20,
                                  right:
                                      MediaQuery.of(context).size.width / 20),
                              constraints: const BoxConstraints(
                                maxHeight: double.infinity,
                                minHeight: 60,
                              ),
                              child: Column(
                                children: [
                                  Html(
                                    data: data[index]["terms"],
                                    // style: TextStyle(fontSize: 18),
                                  ),
                                  // Html(data: data[index]["best_answer"])
                                ],
                              ))),
                    ],
                  ),
                ]),
              );
            },
            itemCount: data.length,
          ),
        ));
  }

  Future<List<dynamic>> terms() async {
    var response = await http.post(
      Uri.parse("https://panel.speakify.co.in/webservices/terms_conditions"),
      headers: {"SPEAKIFY-API-KEY": "25ab96eb73074ed4ecaaa3ec09c1b5f5c482966f"},
    );
    print("ter" + response.body.toString());
    print(response.statusCode);
    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      if (res['status'] == "1") {
        setState(() {
          data = res['data'];
        });
      }
    }
    return data;
  }
}
