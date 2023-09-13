import 'package:flutter/material.dart';
import 'package:alhaouz/screens/home/widgets/douars_list.dart';
import 'package:alhaouz/screens/home/widgets/home_app_bar.dart';
import 'package:alhaouz/screens/home/widgets/douar_list.dart';
import 'package:alhaouz/screens/home/widgets/search_card.dart';
import 'package:alhaouz/screens/home/widgets/tag_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //HomeAPpBar(),

                SearchCard(),
                TagsList(),
                Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    margin: EdgeInsets.only(bottom: 40),
                    child: DouarsList()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}