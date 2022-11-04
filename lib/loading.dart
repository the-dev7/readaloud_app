import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(255, 189, 66, 1),
      child: const Center(
        child: SpinKitFadingCube(
          color: Colors.black,
          size: 50.0,
        ),
      ),
    );
  }
}
