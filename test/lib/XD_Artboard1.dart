import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class XD_Artboard1 extends StatelessWidget {
  XD_Artboard1({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffff5e5e),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(146.0, 123.0),
            child: Text(
              'itlejsdc ',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 20,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
