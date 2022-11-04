import 'dart:io';
import 'dart:math';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readaloud_app/provider/sign_in.dart';

import 'main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  bool textScanning = false;
  XFile? imageFile;
  String scannedText = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "ReadAloud",
          style: TextStyle(
            fontFamily: 'Hubballi-Regular',
            fontSize: 28.0,
            color: Color.fromRGBO(255, 189, 66, 1),
            fontWeight: FontWeight.w400,
          ),
        ),

        actions: [
          IconButton(
            //icon: const Icon(Icons.menu),
            icon: const Icon(Icons.logout, size: 28.0, color: Color.fromRGBO(255, 189, 66, 1)),
            tooltip: "Sign Out",
            onPressed: () {
              AuthService().logOut();
            },
          ),
        ],
      ),

      body: Container(
              color: Colors.black,
              height: height,
              width: width,
              // margin: const EdgeInsets.all(20),
              child: Stack(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (textScanning) const CircularProgressIndicator(),
                  if (!textScanning && imageFile == null)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 0),
                      width: width,
                      height: height / 1,
                      color: Colors.grey[300]!,
                      child: CameraApp(),
                    ),
                  if (imageFile != null) Image.file(File(imageFile!.path)),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.only(top: 15, bottom: 10),
                      width: width * 0.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                        color: Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            child: Icon(Icons.insert_photo_outlined, color: Color.fromRGBO(255, 189, 66, 1), size: 30.0),
                            style: ElevatedButton.styleFrom(
                              elevation: 3,
                              backgroundColor: Colors.black,
                              padding: EdgeInsets.all(10),
                              shadowColor: const Color.fromRGBO(255, 189, 66, 1),
                              shape: CircleBorder(
                                side: BorderSide(width: 1.8, color: Color.fromRGBO(255, 189, 66, 0.3)),
                              ),
                            ),
                            onPressed: () => getImage(ImageSource.gallery),
                          ),

                          ElevatedButton(
                            child: Transform.rotate(
                                angle: pi/2,
                                child: Icon(CupertinoIcons.chevron_left_2, color: Color.fromRGBO(255, 189, 66, 0.6), size: 23.0)
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(5),
                              backgroundColor: Colors.black,
                              shape: CircleBorder(
                                side: BorderSide(width: 1.8, color: Colors.transparent),
                              ),
                            ),
                            onPressed: () => showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                                ),
                                isScrollControlled: true,
                                builder: (context) => buildSheet(),
                            ),
                          ),

                          ElevatedButton(
                            child: Icon(Icons.camera_outlined, color: Color.fromRGBO(255, 189, 66, 1), size: 30.0),
                            style: ElevatedButton.styleFrom(
                              elevation: 3,
                              backgroundColor: Colors.black,
                              padding: EdgeInsets.all(10),
                              shadowColor: const Color.fromRGBO(255, 189, 66, 1),
                              shape: CircleBorder(
                                side: BorderSide(width: 1.8, color: Color.fromRGBO(255, 189, 66, 0.3)),
                              ),
                            ),
                            onPressed: () => getImage(ImageSource.camera),
                          ),


                        ],
                      ),
                    ),
                  ),
                ],
              )
          ),
        );
  }

  // floating bottom modal
  Widget buildSheet() => Container(
    padding: EdgeInsets.only(top: 20, bottom: 30, left: 20, right: 20),
    decoration: BoxDecoration(
      color: Color.fromRGBO(20,20,20,1),
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
    ),
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Icon(Icons.transcribe_outlined, color: Color.fromRGBO(255, 189, 66, 1), size: 30.0),
                style: ElevatedButton.styleFrom(
                  elevation: 3,
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.all(15),
                  shadowColor: const Color.fromRGBO(255, 189, 66, 1),
                  shape: CircleBorder(
                    side: BorderSide(width: 1.8, color: Color.fromRGBO(255, 189, 66, 0.3)),
                  ),
                ),
                onPressed: () => {},
              ),

              ElevatedButton(
                child: Icon(Icons.translate, color: Color.fromRGBO(255, 189, 66, 1), size: 30.0),
                style: ElevatedButton.styleFrom(
                  elevation: 3,
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.all(15),
                  shadowColor: const Color.fromRGBO(255, 189, 66, 1),
                  shape: CircleBorder(
                    side: BorderSide(width: 1.8, color: Color.fromRGBO(255, 189, 66, 0.3)),
                  ),
                ),
                onPressed: () => {},
              ),

              ElevatedButton(
                child: Icon(Icons.text_snippet_outlined, color: Color.fromRGBO(255, 189, 66, 1), size: 30.0),
                style: ElevatedButton.styleFrom(
                  elevation: 3,
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.all(15),
                  shadowColor: const Color.fromRGBO(255, 189, 66, 1),
                  shape: CircleBorder(
                    side: BorderSide(width: 1.8, color: Color.fromRGBO(255, 189, 66, 0.3)),
                  ),
                ),
                onPressed: () => {},
              ),

            ],
          ),

          SizedBox(height: 30.0),
          Text("Captured Text", style: TextStyle(fontSize: 20.0, color: Color.fromRGBO(255, 190, 70, 1))),
          SizedBox(height: 20.0),
          if (scannedText != "")
            Text(scannedText, textAlign: TextAlign.justify, style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.6))),
          if (scannedText == "")
            Text("No text detected..", textAlign: TextAlign.justify, style: TextStyle(fontSize: 18, color: Colors.white.withOpacity(0.4))),
        ],
      ),
    ),
  );

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        setState(() {});
        getRecognisedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = "Error occurred while scanning";
      setState(() {});
    }
  }

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = "$scannedText${line.text}\n";
      }
    }
    textScanning = false;
    setState(() {});
  }
}

// live camera

class CameraApp extends StatefulWidget {
  const CameraApp({Key? key}) : super(key: key);

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {

  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras![0], ResolutionPreset.high);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose()
  {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return CameraPreview(controller);
  }
}
