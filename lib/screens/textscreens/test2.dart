import 'package:flutter/material.dart';

class Test2 extends StatelessWidget {
  const Test2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Text(
            "List of donations, We are working on it",
            style: TextStyle(color: Theme.of(context).primaryColor),
          )),
    );
  }
}