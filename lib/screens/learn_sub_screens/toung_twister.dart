import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Toung extends StatefulWidget {
  const Toung({Key? key}) : super(key: key);

  @override
  State<Toung> createState() => _ToungState();
}

class _ToungState extends State<Toung> {
  List<dynamic> stateList = [];
  var audio = AudioPlayer();

  bool status = false;
  bool id = false;

  @override
  Widget build(BuildContext context) {
    getJobsData().then((value) => stateList.addAll(value));
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
              title: const Text("Tongue Twister"),
            ),
            body: ListView.builder(
              itemBuilder: (context, index) {
                // var _pressGeoON = "${stateList[index]}";
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
                                child: Text(
                                  "${stateList[index]["title_text"]}",
                                  style: TextStyle(fontSize: 18),
                                ))),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        child: Container(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width / 20,
                              bottom: MediaQuery.of(context).size.height / 50),
                          child: IconButton(
                              icon: const Icon(Icons.play_arrow),
                              onPressed: () {
                                audio.play(UrlSource(
                                    "${stateList[index]["audio_file"]}"));
                              }),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(
                                color: Color.fromARGB(248, 39, 80, 141))),
                        // color: status
                        //     ? Color.fromARGB(248, 39, 80, 141)
                        //     : Color.fromARGB(248, 39, 80, 141),

                        child: id
                            ? Text(
                                "Punch in",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                "Punch out",
                                style: TextStyle(fontSize: 16),
                              ),
                        onPressed: () {
                          setState(() {
                            status = !status;
                            id = !id;
                          });
                        })
                  ]),
                );
              },
              itemCount: stateList.length,
            )));
  }

  Future<List<dynamic>> getJobsData() async {
    var response = await http.get(
        Uri.parse('https://panel.speakify.co.in/webservices/toungue'),
        headers: {
          'SPEAKIFY-API-KEY': '25ab96eb73074ed4ecaaa3ec09c1b5f5c482966f',
        });
    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      setState(() {
        if (res['status'] == "1") {
          stateList = res['data'] as List;
        }
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Somthing Went Wrong')));
    }
    return stateList;
  }
}
