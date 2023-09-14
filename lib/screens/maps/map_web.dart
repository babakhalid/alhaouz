import 'package:flutter/material.dart';
import 'package:webview_all/webview_all.dart';

class MyBrowser extends StatefulWidget {
  const MyBrowser({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyBrowserState createState() => _MyBrowserState();
}

class _MyBrowserState extends State<MyBrowser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.95,
        width:MediaQuery.of(context).size.width ,
        child: Center(
          // Look here!
            child: Webview(url: "https://map.alhaouz.org/")
        )
    );
  }
}