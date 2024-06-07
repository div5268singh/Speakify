import 'package:flutter/material.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
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
          title: const Text("Payment History"),
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 255, 254, 254),
                  ),
                  height: MediaQuery.of(context).size.height / 7.5,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 25,
                          ),
                          width: MediaQuery.of(context).size.width / 4.5,
                          // color: Colors.black,
                          child: Image.asset(
                            "assets/images/platinum.png",
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: "Platinum Plan\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                          TextSpan(
                              text: "20/06/2020",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 97, 94, 94),
                                  fontSize: 16)),
                        ])),
                        // color: Colors.grey
                      ),
                      Container(
                        child: Image.asset(
                          "assets/images/rupee.png",
                          fit: BoxFit.fitWidth,
                        ),
                        width: MediaQuery.of(context).size.width / 15,
                        //color: Colors.black
                      ),
                      Container(
                        child: Text(
                          "300",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        width: MediaQuery.of(context).size.width / 9,
                        //color: Colors.black
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 255, 254, 254),
                  ),
                  height: MediaQuery.of(context).size.height / 7.5,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 40,
                    left: MediaQuery.of(context).size.width / 30,
                    right: MediaQuery.of(context).size.width / 30,
                  ),
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 40,
                      bottom: MediaQuery.of(context).size.height / 40,
                      left: MediaQuery.of(context).size.width / 30,
                      right: MediaQuery.of(context).size.width / 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 25,
                          ),
                          width: MediaQuery.of(context).size.width / 4.5,
                          // color: Colors.black,
                          child: Image.asset(
                            "assets/images/silver.png",
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: "Silver Plan\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                          TextSpan(
                              text: "22/12/2020",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 97, 94, 94),
                                  fontSize: 16)),
                        ])),
                        // color: Colors.grey
                      ),
                      Container(
                        child: Image.asset(
                          "assets/images/rupee.png",
                          fit: BoxFit.fitWidth,
                        ),
                        width: MediaQuery.of(context).size.width / 15,
                        //color: Colors.black
                      ),
                      Container(
                        child: Text(
                          "100",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        width: MediaQuery.of(context).size.width / 9,
                        //color: Colors.black
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 255, 254, 254),
                  ),
                  height: MediaQuery.of(context).size.height / 7.5,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 40,
                    left: MediaQuery.of(context).size.width / 30,
                    right: MediaQuery.of(context).size.width / 30,
                  ),
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 40,
                      bottom: MediaQuery.of(context).size.height / 40,
                      left: MediaQuery.of(context).size.width / 30,
                      right: MediaQuery.of(context).size.width / 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 25,
                          ),
                          width: MediaQuery.of(context).size.width / 4.5,
                          // color: Colors.black,
                          child: Image.asset(
                            "assets/images/gold.png",
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: "Gold Plan\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                          TextSpan(
                              text: "22/08/2021",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 97, 94, 94),
                                  fontSize: 16)),
                        ])),
                        // color: Colors.grey
                      ),
                      Container(
                        child: Image.asset(
                          "assets/images/rupee.png",
                          fit: BoxFit.fitWidth,
                        ),
                        width: MediaQuery.of(context).size.width / 15,
                        //color: Colors.black
                      ),
                      Container(
                        child: Text(
                          "200",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        width: MediaQuery.of(context).size.width / 9,
                        //color: Colors.black
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 255, 254, 254),
                  ),
                  height: MediaQuery.of(context).size.height / 7.5,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 40,
                    left: MediaQuery.of(context).size.width / 30,
                    right: MediaQuery.of(context).size.width / 30,
                  ),
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 40,
                      bottom: MediaQuery.of(context).size.height / 40,
                      left: MediaQuery.of(context).size.width / 30,
                      right: MediaQuery.of(context).size.width / 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 25,
                          ),
                          width: MediaQuery.of(context).size.width / 4.5,
                          // color: Colors.black,
                          child: Image.asset(
                            "assets/images/gold.png",
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: "Gold Plan\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                          TextSpan(
                              text: "20/06/2021",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 97, 94, 94),
                                  fontSize: 16)),
                        ])),
                        // color: Colors.grey
                      ),
                      Container(
                        child: Image.asset(
                          "assets/images/rupee.png",
                          fit: BoxFit.fitWidth,
                        ),
                        width: MediaQuery.of(context).size.width / 15,
                        //color: Colors.black
                      ),
                      Container(
                        child: Text(
                          "200",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        width: MediaQuery.of(context).size.width / 9,
                        //color: Colors.black
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 255, 254, 254),
                  ),
                  height: MediaQuery.of(context).size.height / 7.5,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 40,
                    left: MediaQuery.of(context).size.width / 30,
                    right: MediaQuery.of(context).size.width / 30,
                  ),
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 40,
                      bottom: MediaQuery.of(context).size.height / 40,
                      left: MediaQuery.of(context).size.width / 30,
                      right: MediaQuery.of(context).size.width / 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 25,
                          ),
                          width: MediaQuery.of(context).size.width / 4.5,
                          // color: Colors.black,
                          child: Image.asset(
                            "assets/images/platinum.png",
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: "Platinum Plan\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                          TextSpan(
                              text: "20/12/2021",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 97, 94, 94),
                                  fontSize: 16)),
                        ])),
                        // color: Colors.grey
                      ),
                      Container(
                        child: Image.asset(
                          "assets/images/rupee.png",
                          fit: BoxFit.fitWidth,
                        ),
                        width: MediaQuery.of(context).size.width / 15,
                        //color: Colors.black
                      ),
                      Container(
                        child: Text(
                          "300",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        width: MediaQuery.of(context).size.width / 9,
                        //color: Colors.black
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 255, 254, 254),
                  ),
                  height: MediaQuery.of(context).size.height / 7.5,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 40,
                    left: MediaQuery.of(context).size.width / 30,
                    right: MediaQuery.of(context).size.width / 30,
                  ),
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 40,
                      bottom: MediaQuery.of(context).size.height / 40,
                      left: MediaQuery.of(context).size.width / 30,
                      right: MediaQuery.of(context).size.width / 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 25,
                          ),
                          width: MediaQuery.of(context).size.width / 4.5,
                          // color: Colors.black,
                          child: Image.asset(
                            "assets/images/silver.png",
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: "Silver Plan\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                          TextSpan(
                              text: "20/06/2022",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 97, 94, 94),
                                  fontSize: 16)),
                        ])),
                        // color: Colors.grey
                      ),
                      Container(
                        child: Image.asset(
                          "assets/images/rupee.png",
                          fit: BoxFit.fitWidth,
                        ),
                        width: MediaQuery.of(context).size.width / 15,
                        //color: Colors.black
                      ),
                      Container(
                        child: Text(
                          "100",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        width: MediaQuery.of(context).size.width / 9,
                        //color: Colors.black
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 255, 254, 254),
                  ),
                  height: MediaQuery.of(context).size.height / 7.5,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 40,
                    left: MediaQuery.of(context).size.width / 30,
                    right: MediaQuery.of(context).size.width / 30,
                  ),
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 40,
                      bottom: MediaQuery.of(context).size.height / 40,
                      left: MediaQuery.of(context).size.width / 30,
                      right: MediaQuery.of(context).size.width / 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 25,
                          ),
                          width: MediaQuery.of(context).size.width / 4.5,
                          // color: Colors.black,
                          child: Image.asset(
                            "assets/images/silver.png",
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: "Silver Plan\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                          TextSpan(
                              text: "22/06/2022",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 97, 94, 94),
                                  fontSize: 16)),
                        ])),
                        // color: Colors.grey
                      ),
                      Container(
                        child: Image.asset(
                          "assets/images/rupee.png",
                          fit: BoxFit.fitWidth,
                        ),
                        width: MediaQuery.of(context).size.width / 15,
                        //color: Colors.black
                      ),
                      Container(
                        child: Text(
                          "200",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        width: MediaQuery.of(context).size.width / 9,
                        //color: Colors.black
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 255, 254, 254),
                  ),
                  height: MediaQuery.of(context).size.height / 7.5,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 40,
                    left: MediaQuery.of(context).size.width / 30,
                    right: MediaQuery.of(context).size.width / 30,
                  ),
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 40,
                      bottom: MediaQuery.of(context).size.height / 40,
                      left: MediaQuery.of(context).size.width / 30,
                      right: MediaQuery.of(context).size.width / 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 25,
                          ),
                          width: MediaQuery.of(context).size.width / 4.5,
                          // color: Colors.black,
                          child: Image.asset(
                            "assets/images/platinum.png",
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: "Platinum Plan\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                          TextSpan(
                              text: "20/06/2020",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 97, 94, 94),
                                  fontSize: 16)),
                        ])),
                        // color: Colors.grey
                      ),
                      Container(
                        child: Image.asset(
                          "assets/images/rupee.png",
                          fit: BoxFit.fitWidth,
                        ),
                        width: MediaQuery.of(context).size.width / 15,
                        //color: Colors.black
                      ),
                      Container(
                        child: Text(
                          "300",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        width: MediaQuery.of(context).size.width / 9,
                        //color: Colors.black
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 255, 254, 254),
                  ),
                  height: MediaQuery.of(context).size.height / 7.5,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 40,
                    left: MediaQuery.of(context).size.width / 30,
                    right: MediaQuery.of(context).size.width / 30,
                  ),
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 40,
                      bottom: MediaQuery.of(context).size.height / 40,
                      left: MediaQuery.of(context).size.width / 30,
                      right: MediaQuery.of(context).size.width / 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 25,
                          ),
                          width: MediaQuery.of(context).size.width / 4.5,
                          // color: Colors.black,
                          child: Image.asset(
                            "assets/images/gold.png",
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: "Gold Plan\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                          TextSpan(
                              text: "20/06/2020",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 97, 94, 94),
                                  fontSize: 16)),
                        ])),
                        // color: Colors.grey
                      ),
                      Container(
                        child: Image.asset(
                          "assets/images/rupee.png",
                          fit: BoxFit.fitWidth,
                        ),
                        width: MediaQuery.of(context).size.width / 15,
                        //color: Colors.black
                      ),
                      Container(
                        child: Text(
                          "300",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        width: MediaQuery.of(context).size.width / 9,
                        //color: Colors.black
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 255, 254, 254),
                  ),
                  height: MediaQuery.of(context).size.height / 7.5,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 40,
                    left: MediaQuery.of(context).size.width / 30,
                    right: MediaQuery.of(context).size.width / 30,
                  ),
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 40,
                      bottom: MediaQuery.of(context).size.height / 40,
                      left: MediaQuery.of(context).size.width / 30,
                      right: MediaQuery.of(context).size.width / 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 25,
                          ),
                          width: MediaQuery.of(context).size.width / 4.5,
                          // color: Colors.black,
                          child: Image.asset(
                            "assets/images/platinum.png",
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: "Platinum Plan\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                          TextSpan(
                              text: "20/06/2020",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 97, 94, 94),
                                  fontSize: 16)),
                        ])),
                        // color: Colors.grey
                      ),
                      Container(
                        child: Image.asset(
                          "assets/images/rupee.png",
                          fit: BoxFit.fitWidth,
                        ),
                        width: MediaQuery.of(context).size.width / 15,
                        //color: Colors.black
                      ),
                      Container(
                        child: Text(
                          "300",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        width: MediaQuery.of(context).size.width / 9,
                        //color: Colors.black
                      )
                    ],
                  ),
                ),
              ]),
            )));
  }
}
