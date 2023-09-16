import 'package:alhaouz/screens/home/home_screen2.dart';
import 'package:alhaouz/screens/maps/map_web.dart';
import 'package:alhaouz/utils/consts.dart';

import 'package:flutter/material.dart';
import 'package:alhaouz/screens/home/home_screen.dart';
import 'package:alhaouz/screens/textscreens/test1.dart';
import 'package:alhaouz/screens/textscreens/test2.dart';
import 'package:alhaouz/screens/textscreens/test3.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'commons/bottom_tab_bar.dart';
import 'models/association.dart';
import 'screens/association/list_association.dart';
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
    AssociationList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SpeedDial(
          backgroundColor: buttoncolor,
          icon: Icons.add_circle_outline_sharp,
          overlayColor: primary,

          //provide here features of your parent FAB

          children: [
            SpeedDialChild(
              child: Icon(Icons.help_outline),
              label: 'طلب مساعدة',
              onTap: () {
                //selectFileToUpload(widget.events!.title!);
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.sync),
              label: 'تنسيق',
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomFormPage();
                    }
                );
                /*showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      FormDialog(widget.events!.id!),
                );*/
              },
            ),
          ]),

      /*FloatingActionButton(
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
      ),*/
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

