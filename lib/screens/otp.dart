import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:speakify/sign_up_number.dart';

class OTP extends StatefulWidget {
  final String phone;

  const OTP(this.phone, {Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  String verificationIDRecived = "";
  String otp = "";
  @override
  void initState() {
    super.initState();
    verify();
  }

  @override
  Widget build(BuildContext context) {
    var phoneno = widget.phone;
    return WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(10.0),
                child: AppBar(
                  backgroundColor: const Color.fromARGB(255, 3, 47, 117),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                )),
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
                child: Stack(children: <Widget>[
                  SingleChildScrollView(
                      child: Container(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 10,
                              right: MediaQuery.of(context).size.width / 20,
                              left: MediaQuery.of(context).size.width / 20),
                          child: Column(children: [
                            Center(
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height:
                                      MediaQuery.of(context).size.height / 5.5,
                                  child: Image.asset(
                                      "assets/images/varifaction.png")),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 80,
                            ),
                            const Text(
                              "Varification",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 80,
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'You will get OTP Via ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 135, 130, 130),
                                    ),
                                  ),
                                  TextSpan(
                                      text: 'SMS',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 30,
                            ),
                            OTPTextField(
                                length: 6,
                                width: MediaQuery.of(context).size.width / 1,
                                fieldWidth: 45,
                                fieldStyle: FieldStyle.underline,
                                otpFieldStyle: OtpFieldStyle(
                                    focusBorderColor: Colors.black,
                                    borderColor: Colors.black),
                                textFieldAlignment:
                                    MainAxisAlignment.spaceAround,
                                outlineBorderRadius: 15,
                                onCompleted: (pin) {
                                  setState(() {
                                    otp = pin;
                                    // phoneno = widget.phone;
                                  });
                                }),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 30,
                            ),
                            GestureDetector(
                                onTap: () async {
                                  print(otp + "          hdsjjfh");
                                  await FirebaseAuth.instance
                                      .signInWithCredential(
                                          PhoneAuthProvider.credential(
                                              verificationId:
                                                  verificationIDRecived,
                                              smsCode: otp))
                                      .then((value) async {
                                    print("object");
                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //     SnackBar(
                                    //         content: Text(
                                    //             'OTP Verify Successfully')));

                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Sign_up_no(phoneno)));
                                  });
                                },
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1,
                                    height:
                                        MediaQuery.of(context).size.height / 16,
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
                                        'VERIFY',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ))),
                          ])))
                ]))));
  }

  verify() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              print("you logged in");
            }
          });
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
          //print("hbkxgbcfh");
        },
        codeSent: (String verificationID, int? resendToken) {
          setState(() {
            verificationIDRecived = verificationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            verificationIDRecived = verificationID;
          });
        });
    timeout:
    Duration(seconds: 60);
  }
}
