import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:speakify/screens/learn_sub_screens/daily_conversation.dart';
import 'package:speakify/screens/learn_sub_screens/english_tips.dart';
import 'package:speakify/screens/learn_sub_screens/hr_interview.dart';
import 'package:speakify/screens/learn_sub_screens/basic_grammar.dart';
import 'package:speakify/screens/learn_sub_screens/toung_twister.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Learn extends StatefulWidget {
  const Learn({Key? key}) : super(key: key);

  @override
  State<Learn> createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  List<dynamic> data = [];
  late SharedPreferences loginData;
  late BannerAd _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _google_Ads();
  }

  _google_Ads() {
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-8506932795317954/9084530091',
      request: AdRequest(
        keywords: <String>['foo', 'bar'],
        contentUrl: 'http://',
        nonPersonalizedAds: true,
      ),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          print(" hi this is ad of learn $ad");
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          print(error);
          print(" error $ad  error 2  ${error}");
        },
      ),
    );
    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 3, 47, 117),
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: const Text("Learn"),
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
                Row(children: [
                  GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => const Toung())),
                      child: Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 40,
                              right: MediaQuery.of(context).size.width / 40,
                              top: MediaQuery.of(context).size.height / 60,
                              bottom: MediaQuery.of(context).size.height / 20),
                          height: MediaQuery.of(context).size.height / 5,
                          width: MediaQuery.of(context).size.width / 2,
                          color: Color.fromARGB(255, 242, 251, 255),
                          child: Stack(
                            children: [
                              Center(
                                  child: SizedBox(
                                width: MediaQuery.of(context).size.width / 4,
                                height:
                                    MediaQuery.of(context).size.height / 15.5,
                                child: Image.asset(
                                  "assets/images/speaking.png",
                                  color: const Color.fromARGB(255, 3, 47, 117),
                                ),
                              )),
                              const Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "Tongue Twister",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 129, 123, 123)),
                                  ))
                            ],
                          ))),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 90,
                  ),
                  GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const EnglishTips())),
                      child: Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 40,
                              right: MediaQuery.of(context).size.width / 40,
                              top: MediaQuery.of(context).size.height / 60,
                              bottom: MediaQuery.of(context).size.height / 20),
                          height: MediaQuery.of(context).size.height / 5,
                          width: MediaQuery.of(context).size.width / 2.05,
                          color: Color.fromARGB(255, 242, 251, 255),
                          child: Stack(
                            children: [
                              Center(
                                child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    height: MediaQuery.of(context).size.height /
                                        15.5,
                                    child: Image.asset(
                                      "assets/images/light.png",
                                      color:
                                          const Color.fromARGB(255, 3, 47, 117),
                                    )),
                              ),
                              const Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "English Tips",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 129, 123, 123)),
                                  ))
                            ],
                          )))
                ]),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 200,
                ),
                Row(children: [
                  GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const DailyConversation())),
                      child: Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 40,
                              right: MediaQuery.of(context).size.width / 40,
                              top: MediaQuery.of(context).size.height / 60,
                              bottom: MediaQuery.of(context).size.height / 20),
                          height: MediaQuery.of(context).size.height / 5,
                          width: MediaQuery.of(context).size.width / 2,
                          color: Color.fromARGB(255, 242, 251, 255),
                          child: Stack(
                            children: [
                              Center(
                                  child: SizedBox(
                                width: MediaQuery.of(context).size.width / 4,
                                height:
                                    MediaQuery.of(context).size.height / 15.5,
                                child: Image.asset(
                                  "assets/images/conversation.png",
                                  color: const Color.fromARGB(255, 3, 47, 117),
                                ),
                              )),
                              const Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "Daily Conversation",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 129, 123, 123)),
                                  ))
                            ],
                          ))),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 90,
                  ),
                  GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const BasicGrammer())),
                      child: Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 40,
                              right: MediaQuery.of(context).size.width / 40,
                              top: MediaQuery.of(context).size.height / 60,
                              bottom: MediaQuery.of(context).size.height / 20),
                          height: MediaQuery.of(context).size.height / 5,
                          width: MediaQuery.of(context).size.width / 2.05,
                          color: Color.fromARGB(255, 242, 251, 255),
                          child: Stack(
                            children: [
                              Center(
                                child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    height: MediaQuery.of(context).size.height /
                                        15.5,
                                    child: Image.asset(
                                      "assets/images/openbook.png",
                                      color:
                                          const Color.fromARGB(255, 3, 47, 117),
                                    )),
                              ),
                              const Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "Basic Grammar",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 129, 123, 123)),
                                  ))
                            ],
                          )))
                ]),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 200,
                ),
                GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => HrInterview())),
                    child: Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 40,
                            right: MediaQuery.of(context).size.width / 40,
                            top: MediaQuery.of(context).size.height / 60,
                            bottom: MediaQuery.of(context).size.height / 20),
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 1,
                        color: Color.fromARGB(255, 242, 251, 255),
                        child: Stack(
                          children: [
                            Center(
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 5,
                                  height:
                                      MediaQuery.of(context).size.height / 15.5,
                                  child: Image.asset(
                                    "assets/images/interview.png",
                                    color:
                                        const Color.fromARGB(255, 3, 47, 117),
                                  )),
                            ),
                            const Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "HR Interview",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 129, 123, 123)),
                                ))
                          ],
                        ))),
              ]))),
          bottomNavigationBar: _isAdLoaded
              ? Container(
                  color: Colors.transparent,
                  height: _bannerAd.size.height.toDouble(),
                  width: _bannerAd.size.width.toDouble(),
                  child: AdWidget(ad: _bannerAd),
                )
              : const SizedBox(),
        ));
  }
}
