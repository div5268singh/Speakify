import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:speakify/sign_up_email.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          print(" hi this is ad of home $ad");
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
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
        backgroundColor: Color.fromARGB(255, 242, 251, 255),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 3, 47, 117),
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text("Home"),
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
          child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / 7,
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
                    BorderRadius.only(bottomRight: Radius.circular(90)),
              ),
              child: Align(
                  child: Stack(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 12,
                ),
                const Text(
                  'Start Talking With Strangers',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ])),
            ),
            Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 12,
                    left: MediaQuery.of(context).size.width / 10,
                    right: MediaQuery.of(context).size.width / 10,
                    bottom: MediaQuery.of(context).size.height / 2),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1,
                  height: MediaQuery.of(context).size.height / 5,
                  color: Colors.white,
                  child: const Text("Practice Now"),
                )),
            GestureDetector(
                // onTap: () => Navigator.of(context).push(MaterialPageRoute(
                //     builder: (BuildContext context) => Sign_email())),
                child: Container(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 60),
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 1.6,
                        left: MediaQuery.of(context).size.width / 4),
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.height / 15,
                    color: const Color.fromARGB(255, 3, 47, 117),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.local_phone,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 25,
                        ),
                        const Text(
                          "Call Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    )))
          ]),
        ),
        bottomNavigationBar: _isAdLoaded
            ? Container(
                color: Colors.transparent,
                height: _bannerAd.size.height.toDouble(),
                width: _bannerAd.size.width.toDouble(),
                child: AdWidget(ad: _bannerAd),
              )
            : SizedBox(),
      ),
    );
  }
}
