import 'package:alhaouz/screens/home/home_screen2.dart';
import 'package:alhaouz/screens/maps/map_web.dart';

import 'package:flutter/material.dart';
import 'package:alhaouz/screens/home/home_screen.dart';
import 'package:alhaouz/screens/textscreens/test1.dart';
import 'package:alhaouz/screens/textscreens/test2.dart';
import 'package:alhaouz/screens/textscreens/test3.dart';
import 'commons/bottom_tab_bar.dart';
import 'models/association.dart';
import 'screens/home/widgets/form_sync.dart';
import 'screens/maps/map2.dart';


class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;


  final List<Widget> pageList = <Widget>[
    Home(),
    MyBrowser(),
    Test2(),
    Test3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff398480),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomFormPage();
              }
          );
        },
        child: Icon(Icons.add),
      ),
      body: pageList[pageIndex],
      bottomNavigationBar: BottomTabBar(
        index:pageIndex,
        onChangedTab:OnChangeTab,
      ),
    );
  }
  void OnChangeTab(int index){
    setState(() {
      this.pageIndex=index;
    });
  }


}

