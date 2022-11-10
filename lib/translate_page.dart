import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'DropDownButtonLang.dart';

List<String> totalLangs = [
  "Arabic",
  "Bengali",
  "Bulgarian",
  "Czech",
  "Dutch",
  "English",
  "Esperanto",
  "French",
  "German",
  "Greek",
  "Gujarati",
  "Hawaiian",
  "Hindi",
  "Hungarian",
  "Irish",
  "Italian",
  "Japanese",
  "Kannada",
  "Korean",
  "Latin",
  "Malayalam",
  "Marathi",
  "Myanmar",
  "Nepali",
  "Persian",
  "Polish",
  "Punjabi",
  "Russian",
  "Sindhi",
  "Spanish",
  "Swedish",
  "Tamil",
  "Telugu",
  "Ukrainian",
  "Urdu",
  "Vietnamese",
  "Welsh",
  "Xhosa",
  "Yiddish",
  "Zulu"
];

var langMap = {
  "Arabic": "ar",
  "Bengali": "bn",
  "Bulgarian": "bg",
  "Czech": "cs",
  "Dutch": "nl",
  "English": "en",
  "Esperanto": "eo",
  "French": "fr",
  "German": "ka",
  "Greek": "el",
  "Gujarati": "gu",
  "Hawaiian": "haw",
  "Hindi": "hi",
  "Hungarian": "hu",
  "Irish": "ga",
  "Italian": "it",
  "Japanese": "ja",
  "Kannada": "kn",
  "Korean": "ko",
  "Latin": "la",
  "Malayalam": "ml",
  "Marathi": "mr",
  "Myanmar": "my",
  "Nepali": "ne",
  "Persian": "fa",
  "Polish": "pl",
  "Punjabi": "pa",
  "Russian": "ru",
  "Sindhi": "sd",
  "Spanish": "es",
  "Swedish": "sv",
  "Tamil": "ta",
  "Telugu": "te",
  "Ukrainian": "uk",
  "Urdu": "ur",
  "Vietnamese": "vi",
  "Welsh": "cy",
  "Xhosa": "xh",
  "Yiddish": "yi",
  "Zulu": "zu"
};

final translator = GoogleTranslator();
var chosenLang = "en";
String translatedText = "";

class TranslatePage extends StatefulWidget {
  String scannedText;

  TranslatePage({super.key, required this.scannedText});

  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
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
      ),
      body: Container(
        color: Colors.black,
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              const Text("Captured Text",
                  style: TextStyle(
                      fontSize: 20.0, color: Color.fromRGBO(255, 190, 70, 1))),
              // const SizedBox(height: 20.0),
              if (widget.scannedText != "")
                Container(
                  height: 250,
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: ListView(
                    children: [
                      SelectableText(
                        widget.scannedText,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 20, color: Colors.white.withOpacity(0.6)),
                        showCursor: true,
                        cursorColor: Colors.grey[200],
                        cursorRadius: const Radius.circular(6),
                        scrollPhysics: const ClampingScrollPhysics(),
                      ),
                    ],
                  ),
                ),
              if (widget.scannedText == "")
                Text("No text detected..\n",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 18, color: Colors.white.withOpacity(0.4))),

              DropdownButtonLang(widget.scannedText),
              const SizedBox(height: 20),
              TransText(scannedText: widget.scannedText),
            ],
          ),
        ),
      ),
    );
  }
}
