import 'package:flutter/material.dart';
import 'package:readaloud_app/translate_page.dart';
import 'package:translator/translator.dart';

class DropdownButtonLang extends StatefulWidget {
  const DropdownButtonLang(String scannedText, {super.key});

  @override
  State<DropdownButtonLang> createState() => _DropdownButtonLangState();
}


class _DropdownButtonLangState extends State<DropdownButtonLang> {

  String dropdownValue = totalLangs.first;
  String? dropdownLang = langMap[totalLangs.first];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Color.fromRGBO(255, 189, 66, 1)),
      underline: Column(
        children: [
          Container(
            height: 2,
            color: const Color.fromRGBO(255, 189, 66, 1),
          ),
        ],
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          chosenLang = langMap[value]!;
          print(chosenLang);
        });
      },
      items: totalLangs.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class TransText extends StatefulWidget {
  String scannedText;
  TransText({super.key, required this.scannedText});

  @override
  State<TransText> createState() => _TransTextState();
}

class _TransTextState extends State<TransText> {

  String translated_text = "";

  void translate(String text) async
  {
    await translator.translate(widget.scannedText, from: 'en', to: chosenLang).then((output) {
      setState(() {
        translated_text = output.toString();
        print(translated_text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              elevation: 10,
              backgroundColor: Colors.black,
              padding: const EdgeInsets.all(15),
              side: BorderSide(width: 1, color: Color.fromRGBO(255, 189, 66, 1)),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              shadowColor: const Color.fromRGBO(255, 189, 66, 1),
            ),
            onPressed: () {
              translate(widget.scannedText);
            },
            child: const Text("Translate",
                style: TextStyle(
                    color: Color.fromRGBO(255, 189, 66, 1),
                    fontSize: 18.0)),
          ),
        ),
        SizedBox(height: 50),

        Container(
          height: 100,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              SelectableText(
                translated_text,
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
      ],
    );
  }

}

