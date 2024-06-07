import 'package:flutter/material.dart';
import 'package:speakify/screens/home.dart';
import 'package:speakify/screens/learn.dart';
import 'package:speakify/screens/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Nav extends StatefulWidget {
  Nav({Key? key}) : super(key: key);
  late String id;
  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  var id;

  int currentindex = 0;

  @override
  void initState() {
    super.initState();
    // validateAndSave();
    setUserId();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => true,
        child: GestureDetector(
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
            child: Scaffold(
              backgroundColor: Color.fromARGB(255, 3, 47, 117),
              // body: screens[currentindex],
              // extendBody: true,
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: currentindex,
                // backgroundColor: Colors.transparent,
                onTap: (tappedIndex) =>
                    setState(() => currentindex = tappedIndex),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                    backgroundColor: Color.fromARGB(255, 3, 47, 117),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard),
                    label: "Learn",
                    backgroundColor: Color.fromARGB(255, 3, 47, 117),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "Profile",
                    backgroundColor: Color.fromARGB(255, 3, 47, 117),
                  ),
                ],
                selectedItemColor: Color.fromARGB(255, 100, 0, 139),
              ),
              body: currentindex == 0
                  ? Home()
                  : currentindex == 1
                      ? Learn()
                      : currentindex == 2
                          ? Profile(id)
                          // ? Profile()
                          : Container(),
            )));
  }

  Future<Null> setUserId() async {
    SharedPreferences prefsdf = await SharedPreferences.getInstance();

    setState(() {
      id = prefsdf.getString("id").toString();
      //values = id;
      print("mobile " + id);
    });
  }
}
