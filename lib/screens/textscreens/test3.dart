import 'package:flutter/material.dart';

class Test3 extends StatelessWidget {
  const Test3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Text(
            "List of Associations, We are working on it",
            style: TextStyle(color: Theme.of(context).primaryColor),
          )),
    );
  }
}