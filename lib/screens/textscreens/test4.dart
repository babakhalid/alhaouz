import 'package:flutter/material.dart';

class Test4 extends StatelessWidget {
  const Test4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Text(
            "We are working on it",
            style: TextStyle(color: Theme.of(context).primaryColor),
          )),
    );
  }
}