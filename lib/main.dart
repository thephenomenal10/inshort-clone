import 'package:flutter/material.dart';

import 'homeScreen.dart';

void main(){
  runApp(
    MaterialApp(
        title: "Shortify",
        home: Home(),
        theme: ThemeData(
          fontFamily: 'Circular',
        ),
    )
  );
}