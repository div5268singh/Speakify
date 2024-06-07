import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RemoveAds extends StatefulWidget {
  const RemoveAds({Key? key}) : super(key: key);

  @override
  State<RemoveAds> createState() => _RemoveAdsState();
}

class _RemoveAdsState extends State<RemoveAds> {
  late int amount;
  late String plan;
  Razorpay _razorpay = Razorpay();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 242, 251, 255),
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
          title: const Text("Remove Ads"),
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
                  onTap: () {
                    print("object");
                    setState(() {
                      amount = 100;
                      plan = "Silver";
                      print(amount);
                      openCheckout(amount, plan);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 255, 254, 254),
                    ),
                    height: MediaQuery.of(context).size.height / 6,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 25,
                      left: MediaQuery.of(context).size.width / 30,
                      right: MediaQuery.of(context).size.width / 30,
                    ),
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 40,
                        bottom: MediaQuery.of(context).size.height / 40,
                        left: MediaQuery.of(context).size.width / 30,
                        right: MediaQuery.of(context).size.width / 30),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width / 10,
                            ),
                            width: MediaQuery.of(context).size.width / 4.5,
                            // color: Colors.black,
                            child: Image.asset(
                              "assets/images/silver.png",
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Go With Silver Plan",
                              style: TextStyle(fontSize: 14),
                            ),
                            RichText(
                                text: TextSpan(children: [
                              WidgetSpan(
                                child: Image.asset(
                                  "assets/images/rupee.png",
                                  height:
                                      MediaQuery.of(context).size.height / 40,
                                ),
                              ),
                              TextSpan(
                                  text: " 100",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ])),
                            RichText(
                                text: TextSpan(children: [
                              WidgetSpan(
                                child: Image.asset(
                                  "assets/images/valid.png",
                                  height:
                                      MediaQuery.of(context).size.height / 35,
                                ),
                              ),
                              TextSpan(
                                  text: " 3 Months",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 121, 121, 121),
                                    fontSize: 20,
                                  )),
                            ])),
                          ],
                        )
                      ],
                    ),
                  )),
              GestureDetector(
                onTap: () {
                  print("object1");
                  setState(() {
                    amount = 200;
                    plan = "Gold";
                    print(amount);
                    openCheckout(amount, plan);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 255, 254, 254),
                  ),
                  height: MediaQuery.of(context).size.height / 6,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 35,
                    left: MediaQuery.of(context).size.width / 30,
                    right: MediaQuery.of(context).size.width / 30,
                  ),
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 40,
                      bottom: MediaQuery.of(context).size.height / 40,
                      left: MediaQuery.of(context).size.width / 30,
                      right: MediaQuery.of(context).size.width / 30),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 10,
                          ),
                          width: MediaQuery.of(context).size.width / 4.5,
                          // color: Colors.black,
                          child: Image.asset(
                            "assets/images/gold.png",
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Go With Gold Plan",
                            style: TextStyle(fontSize: 14),
                          ),
                          RichText(
                              text: TextSpan(children: [
                            WidgetSpan(
                              child: Image.asset(
                                "assets/images/rupee.png",
                                height: MediaQuery.of(context).size.height / 40,
                              ),
                            ),
                            TextSpan(
                                text: " 200",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            WidgetSpan(
                              child: Image.asset(
                                "assets/images/valid.png",
                                height: MediaQuery.of(context).size.height / 35,
                              ),
                            ),
                            TextSpan(
                                text: " 6 Months",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 121, 121, 121),
                                  fontSize: 20,
                                )),
                          ])),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("object2");
                  setState(() {
                    amount = 300;
                    plan = "Platinum";
                    print(amount);
                    openCheckout(amount, plan);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 255, 254, 254),
                  ),
                  height: MediaQuery.of(context).size.height / 6,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 35,
                    left: MediaQuery.of(context).size.width / 30,
                    right: MediaQuery.of(context).size.width / 30,
                  ),
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 40,
                      bottom: MediaQuery.of(context).size.height / 40,
                      left: MediaQuery.of(context).size.width / 30,
                      right: MediaQuery.of(context).size.width / 30),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 10,
                          ),
                          width: MediaQuery.of(context).size.width / 4.5,
                          // color: Colors.black,
                          child: Image.asset(
                            "assets/images/platinum.png",
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Go With Platinum Plan",
                            style: TextStyle(fontSize: 14),
                          ),
                          RichText(
                              text: TextSpan(children: [
                            WidgetSpan(
                              child: Image.asset(
                                "assets/images/rupee.png",
                                height: MediaQuery.of(context).size.height / 40,
                              ),
                            ),
                            TextSpan(
                                text: " 300",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            WidgetSpan(
                              child: Image.asset(
                                "assets/images/valid.png",
                                height: MediaQuery.of(context).size.height / 35,
                              ),
                            ),
                            TextSpan(
                                text: " 9 Months",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 121, 121, 121),
                                  fontSize: 20,
                                )),
                          ])),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ]))));
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout(amount, plan) async {
    var options = {
      'key': 'rzp_test_E8eoFDlM2g7VXn',
      'amount': amount * 100,
      'name': 'Divyanshu',
      'description': plan,
      'prefill': {
        'contact': ' +91 - 6394475162',
        'email': 'divyanshu.developerbrothers@gmail.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
      print(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }
}
