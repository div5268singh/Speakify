import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:http/http.dart' as http;
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speakify/Auth/auth_service.dart';
import 'package:speakify/screens/Profile_Screens/about_speakify.dart';
import 'package:speakify/screens/Profile_Screens/contact_us.dart';

import 'package:speakify/screens/Profile_Screens/payment_history.dart';
import 'package:speakify/screens/Profile_Screens/privacy.dart';

import 'package:speakify/screens/Profile_Screens/remove_ads.dart';
import 'package:speakify/screens/Profile_Screens/terms.dart';

import 'package:speakify/screens/login.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  final String id;
  const Profile(
    this.id, {
    Key? key,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late SharedPreferences loginData;
  var audio = AudioPlayer();
  String? user = FirebaseAuth.instance.currentUser?.displayName;
  late BannerAd _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    google_Ads();
  }

  google_Ads() {
    print("object");
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-8506932795317954/9084530091',
      request: const AdRequest(
        keywords: <String>['foo', 'bar'],
        contentUrl: 'http://',
        nonPersonalizedAds: true,
      ),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          print(" hi this is ad of profile $ad");
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          print(error);
        },
      ),
    );
    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    var value = widget.id;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 251, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 47, 117),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
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
              child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "$user",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 70,
                  ),
                  GestureDetector(
                      onTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              title: Text("My Super title"),
                              content: Text("Hello World"),
                              actions: [],
                            );
                          }),
                      child: Image.asset(
                        "assets/images/edit.png",
                        width: MediaQuery.of(context).size.width / 18,
                        color: const Color.fromARGB(255, 3, 47, 117),
                      )),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 55,
              ),
              const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "testuser@gmail.com",
                    style: TextStyle(fontSize: 16),
                  )),
              Container(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 85),
                  constraints: const BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: MediaQuery.of(context).size.height / 3.8,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 80,
                            ),
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 30,
                              right: MediaQuery.of(context).size.width / 30,
                            ),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color.fromARGB(255, 242, 251, 255),
                                  width: 2,
                                ),
                              ),
                            ),
                            child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const RemoveAds())),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/images/remove_ads.png",
                                      width: MediaQuery.of(context).size.width /
                                          18,
                                      color:
                                          const Color.fromARGB(255, 3, 47, 117),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              35,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              35),
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: const Text("Remove Ads",
                                          style: TextStyle(
                                            fontSize: 16,
                                          )),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Color.fromARGB(222, 119, 0, 199),
                                    ),
                                  ],
                                ))),
                        Container(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 80,
                            ),
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 30,
                              right: MediaQuery.of(context).size.width / 30,
                            ),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color.fromARGB(255, 242, 251, 255),
                                  width: 2,
                                ),
                              ),
                            ),
                            child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const PaymentHistory())),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/images/payment-history.png",
                                      width: MediaQuery.of(context).size.width /
                                          18,
                                      color:
                                          const Color.fromARGB(255, 3, 47, 117),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              35,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              35),
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: const Text("Payment History",
                                          style: TextStyle(
                                            fontSize: 16,
                                          )),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Color.fromARGB(222, 119, 0, 199),
                                    ),
                                  ],
                                ))),
                        Container(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 80,
                            ),
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 30,
                              right: MediaQuery.of(context).size.width / 30,
                            ),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color.fromARGB(255, 242, 251, 255),
                                  width: 2,
                                ),
                              ),
                            ),
                            child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Terms())),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/images/terms.png",
                                      width: MediaQuery.of(context).size.width /
                                          18,
                                      color:
                                          const Color.fromARGB(255, 3, 47, 117),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              35,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              35),
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: const Text("Terms & Condition",
                                          style: TextStyle(
                                            fontSize: 16,
                                          )),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Color.fromARGB(222, 119, 0, 199),
                                    ),
                                  ],
                                ))),
                        Container(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 80,
                            ),
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 30,
                              right: MediaQuery.of(context).size.width / 30,
                            ),
                            child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Privacy())),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/images/policy.png",
                                      width: MediaQuery.of(context).size.width /
                                          18,
                                      color:
                                          const Color.fromARGB(255, 3, 47, 117),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              35,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              35),
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: const Text("Privacy Policy",
                                          style: TextStyle(
                                            fontSize: 16,
                                          )),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Color.fromARGB(222, 119, 0, 199),
                                    ),
                                  ],
                                ))),
                      ])),
              Container(
                height: MediaQuery.of(context).size.height / 45,
              ),
              Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 85),
                  constraints: const BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: MediaQuery.of(context).size.height / 4,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color.fromARGB(255, 242, 251, 255),
                                  width: 2,
                                ),
                              ),
                            ),
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 80,
                            ),
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 30,
                              right: MediaQuery.of(context).size.width / 30,
                            ),
                            child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ContactUs(value))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/images/contactus.png",
                                      width: MediaQuery.of(context).size.width /
                                          18,
                                      color:
                                          const Color.fromARGB(255, 3, 47, 117),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              35,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              35),
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: const Text("ContactUs",
                                          style: TextStyle(
                                            fontSize: 16,
                                          )),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Color.fromARGB(222, 119, 0, 199),
                                    ),
                                  ],
                                ))),
                        Container(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 80,
                            ),
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 30,
                              right: MediaQuery.of(context).size.width / 30,
                            ),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color.fromARGB(255, 242, 251, 255),
                                  width: 2,
                                ),
                              ),
                            ),
                            child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            About())),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.info_outline_rounded,
                                      color: Color.fromARGB(255, 3, 47, 117),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              35,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              35),
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: const Text("About Speakify",
                                          style: TextStyle(
                                            fontSize: 16,
                                          )),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Color.fromARGB(222, 119, 0, 199),
                                    ),
                                  ],
                                ))),
                        Container(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 80,
                            ),
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 30,
                              right: MediaQuery.of(context).size.width / 30,
                            ),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color.fromARGB(255, 242, 251, 255),
                                  width: 2,
                                ),
                              ),
                            ),
                            child: GestureDetector(
                                onTap: () {
                                  StoreRedirect.redirect(
                                      androidAppId:
                                          "shri.complete.fitness.gymtrainingapp",
                                      iOSAppId: "585027354");
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.star_outline,
                                      color: Color.fromARGB(255, 3, 47, 117),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              35,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              35),
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: const Text("Rate App",
                                          style: TextStyle(
                                            fontSize: 16,
                                          )),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Color.fromARGB(222, 119, 0, 199),
                                    ),
                                  ],
                                ))),
                        Container(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 80,
                            ),
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 30,
                              right: MediaQuery.of(context).size.width / 30,
                            ),
                            child: GestureDetector(
                                onTap: () => Share.share(
                                      'Hello Welcome to FlutterCampus',
                                    ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.share,
                                      color: Color.fromARGB(255, 3, 47, 117),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              35,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              35),
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: const Text("Share App",
                                          style: TextStyle(
                                            fontSize: 16,
                                          )),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Color.fromARGB(222, 119, 0, 199),
                                    ),
                                  ],
                                ))),
                      ])),
              Container(
                height: MediaQuery.of(context).size.height / 40,
              ),
              GestureDetector(
                  onTap: () async {
                    await GoogleSignIn().disconnect();
                    FirebaseAuth.instance.signOut();
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('You LogOut ')));
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width / 1.10,
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
                          'Sign Out',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ))),
              Container(
                height: MediaQuery.of(context).size.height / 30,
              ),
            ],
          ))),
      bottomNavigationBar: _isAdLoaded
          ? Container(
              color: Colors.transparent,
              height: _bannerAd.size.height.toDouble(),
              width: _bannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd),
            )
          : const SizedBox(),
    );
  }
}
