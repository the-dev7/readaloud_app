import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readaloud_app/provider/sign_in.dart';
import 'package:shimmer/shimmer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:readaloud_app/loading.dart';


class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  var msgList = ['Read', 'Translate', 'Summarize', 'Scan Docs'];
  int msgIndex = 0;

  /*
  alphabets:::
  あ Б δ এ A

   */

  bool isLoading = false;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    /*
    init height conf..
    mask layer : height / 1.5
    lower layer : height / 1.5
    middle layer : height / 1.85
    upper layer : height / 2.5
     */

    return isLoading ? const Loading() : Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(0, 0, 0, 1),
            Color.fromRGBO(40, 40, 40, 1),
          ],
          stops: [0.5, 1],
        )),
        child: Stack(
          children: [
            /*
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: height / 1.5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50)),
                  color: Colors.black,
                ),
              ),
            ),
             */
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: height / 1.55,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50)),
                    color: const Color.fromRGBO(255, 189, 66, 1).withOpacity(0.3),
                  ),
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("あ Б δ এ A",
                        style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 20,
                            color: Color.fromRGBO(0, 0, 0, 1))),
                  ),
                )),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: height / 1.82,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50)),
                    color: const Color.fromRGBO(255, 189, 66, 1).withOpacity(0.34),
                  ),
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("あ Б δ এ A",
                        style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 20,
                            color: Color.fromRGBO(30, 30, 30, 1),
                            fontWeight: FontWeight.w600)),
                  ),
                )),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: height / 2.25,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50)),
                    color: const Color.fromRGBO(255, 189, 66, 1).withOpacity(0.5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      const Text("ReadAloud",
                          style: TextStyle(
                              fontSize: 70.0,
                              color: Color.fromRGBO(55, 55, 55, 1),
                              fontFamily: 'Hubballi',
                              fontWeight: FontWeight.w200)),
                      const SizedBox(height: 15),

                      SizedBox(
                        height: 35,
                        child: AnimatedTextKit(
                          repeatForever: true,
                          //pause: Duration(seconds: 1),
                          animatedTexts: [
                            FadeAnimatedText('◈ TRANSLATE ◈',
                                duration: const Duration(seconds: 2),
                                textStyle: const TextStyle(
                                    fontSize: 23.0,
                                    color: Color.fromRGBO(55, 55, 55, 1),
                                    fontFamily: 'Hubballi',
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.w600)),
                            FadeAnimatedText('◈ SUMMARIZE ◈',
                                duration: const Duration(seconds: 2),
                                textStyle: const TextStyle(
                                    fontSize: 23.0,
                                    color: Color.fromRGBO(55, 55, 55, 1),
                                    fontFamily: 'Hubballi',
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.w600)),
                            FadeAnimatedText('◈ SCAN DOCS ◈',
                                duration: const Duration(seconds: 2),
                                textStyle: const TextStyle(
                                    fontSize: 23.0,
                                    color: Color.fromRGBO(55, 55, 55, 1),
                                    fontFamily: 'Hubballi',
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Positioned(
              bottom: height / 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.04),
                      Shimmer.fromColors(
                          baseColor: const Color.fromRGBO(255, 189, 66, 1),
                          highlightColor: Colors.grey[100]!,
                          child: const Text("SIGN IN TO CONTINUE",
                              style: TextStyle(
                                  fontSize: 25.0,
                                  letterSpacing: 2.0,
                                  fontFamily: 'Hubballi',
                                  fontWeight: FontWeight.w600))),
                      SizedBox(height: height * 0.04),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(270, 55), backgroundColor: const Color.fromRGBO(255, 189, 66, 0.7),
                            elevation: 10.0,
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                        onPressed: () async {
                          setState(() => isLoading = true);

                          bool status = await AuthService().googleLogIn();
                          if (status == false) {
                            if (kDebugMode) {
                              print("issue - unable signing in");
                            }
                          }

                          setState(() => isLoading = false);
                        },
                        label: const Text(" SIGN IN WITH GOOGLE",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontFamily: 'Hubballi',
                                fontWeight: FontWeight.w700)),
                        icon: const FaIcon(FontAwesomeIcons.google,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
