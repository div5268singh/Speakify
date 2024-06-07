import 'package:flutter/material.dart';
import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _navigatetohome() async {
    await Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login())));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Align(
              alignment: Alignment.center,
              child: Center(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.height / 3.5,
                    child: Image.asset("assets/images/logo.png")),
              ),
            )));
  }
}
