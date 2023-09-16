import 'package:flutter/material.dart';

import '../events/event_list.dart';

class Test2 extends StatelessWidget {
  const Test2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: EdgeInsets.only(bottom: 40),
          child: JobList()),
    );
  }
}