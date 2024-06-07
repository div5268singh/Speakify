import 'dart:math';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_button/sign_button.dart';
import 'package:speakify/Auth/auth_service.dart';
import 'package:speakify/screens/otp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String pickedCountryCode = "";

  final TextEditingController noController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void dispode() {
    noController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var phone = "+$pickedCountryCode${noController.text}";
    return WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
            backgroundColor: Colors.white,
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
                child: Form(
                    key: _formKey,
                    child: Stack(children: <Widget>[
                      SingleChildScrollView(
                          child: Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 40,
                            right: MediaQuery.of(context).size.width / 20,
                            left: MediaQuery.of(context).size.width / 20),
                        child: Column(children: [
                          Center(
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width / 1,
                                height:
                                    MediaQuery.of(context).size.height / 3.5,
                                child: Image.asset("assets/images/logo.png")),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 5.2,
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(15.0)),
                                      color: Color.fromARGB(255, 3, 47, 117),
                                    ),
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          35,
                                    ),
                                    child: GestureDetector(
                                      child: Row(children: [
                                        Text(
                                          "+ $pickedCountryCode",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const Icon(Icons.arrow_drop_down,
                                            color: Colors.white)
                                      ]),
                                      onTap: () => showCountryPicker(
                                          // showWorldWide: true,
                                          context: context,
                                          exclude: <String>['KN', 'MF'],
                                          // favorite: <String>['IN'],
                                          showPhoneCode: false,
                                          onSelect: (Country country) {
                                            setState(() {
                                              pickedCountryCode =
                                                  country.phoneCode;
                                            });
                                          },
                                          countryListTheme:
                                              CountryListThemeData(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(40.0),
                                              topRight: Radius.circular(40.0),
                                            ),
                                            inputDecoration: InputDecoration(
                                              labelText: 'Search',
                                              hintText:
                                                  'Start typing to search',
                                              prefixIcon:
                                                  const Icon(Icons.search),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: const Color(0xFF8C98A8)
                                                      .withOpacity(0.2),
                                                ),
                                              ),
                                            ),
                                          )),
                                    )),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width /
                                        1.48,
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    child: TextFormField(
                                      textInputAction: TextInputAction.next,
                                      controller: noController,
                                      keyboardType: TextInputType.phone,
                                      decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Color.fromARGB(
                                              255, 230, 224, 224),
                                          labelText: 'Enter Mobile No',
                                          labelStyle: TextStyle(
                                            color:
                                                Color.fromARGB(255, 3, 47, 117),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 3, 47, 117)),
                                            borderRadius:
                                                BorderRadius.horizontal(
                                                    right:
                                                        Radius.circular(15.0)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 3, 47, 117)),
                                            borderRadius:
                                                BorderRadius.horizontal(
                                                    right:
                                                        Radius.circular(15.0)),
                                          )),
                                    )),
                              ]),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 25.5,
                          ),
                          GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          OTP(phone))),
                              child: Container(
                                  width: MediaQuery.of(context).size.width / 1,
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
                                      'CONTINUE',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ))),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 25.5,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'By Continuing you agree to the and ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 135, 130, 130),
                                  ),
                                ),
                                TextSpan(
                                    text: 'Terms Of Services Privacy Policy',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color.fromARGB(255, 166, 5, 230))),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 5.5,
                          ),
                          SignInButton.mini(
                            buttonSize: ButtonSize.large,
                            buttonType: ButtonType.google,
                            onPressed: () {
                              AuthService().signInWithGoogle();
                            },
                          ),
                        ]),
                      ))
                    ])))));
  }
}
