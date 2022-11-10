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
  const TransText(String scannedText, {super.key});



  @override
  State<TransText> createState() => _TransTextState();
}

class _TransTextState extends State<TransText> {


  @override
  Widget build(BuildContext context) {
    return Container (
      color: Colors.black,
      height: 300,
      width: 300,
          //translation = await translator.translate('Translation', from: 'en', to: 'es');
    // print('${translation.source} (${translation.sourceLanguage}) == ${translation.text} (${translation.targetLanguage})');

    );
  }

}

