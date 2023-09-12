import 'package:alhaouz/screens/search/widgets/search_example.dart';
import 'package:flutter/material.dart';
import 'package:alhaouz/screens/search/widgets/search_app_bar.dart';
import 'package:alhaouz/screens/search/widgets/search_input.dart';
import 'package:alhaouz/screens/search/widgets/search_list.dart';
import 'package:alhaouz/screens/search/widgets/search_option.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),

            ],
          ),
          Column(
            children: [
              SearchAppBar(),
              SearchInput(),
              SearchOption(),
              Expanded(child: SearchList()),


            ],
          )
        ],
      ),
    );
  }
}