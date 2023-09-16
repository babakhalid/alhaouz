import 'package:alhaouz/models/filter.dart';
import 'package:alhaouz/screens/home/widgets/douars_list.dart';
import 'package:alhaouz/utils/consts.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:nb_utils/nb_utils.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activePageIndex = 0;
  bool favTapped = false;
  List<Filter>? selectedZoneList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            surfaceTintColor: buttoncolor,
            pinned: true,
            expandedHeight: 250.0,
            backgroundColor: buttoncolor,
            title: Text("Al Haouz (6981 Douars)"),
            actions: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                //favIcon(isTapped: favTapped),
                8.width,
                //QrcodeIconEvent(event: widget.events!, expired: expired),
              ]).paddingSymmetric(horizontal: 16, vertical: 0),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/alhaouz.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: DefaultTabController(
                    length: 4,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      TabBar(
                      indicatorColor: buttoncolor,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      labelPadding:
                      EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                      indicator: BoxDecoration(),
                      isScrollable: true,
                      onTap: (i) {
                        activePageIndex = i;
                        setState(() {});
                      },
                      tabs: List.generate(menuEventList.length, (index) {
                        return Tab(
                          child: Container(
                            decoration: boxDecorationWithRoundedCorners(
                              borderRadius: radius(12),
                              backgroundColor: index == activePageIndex
                                  ? buttoncolor.withOpacity(0.1)
                                  : Colors.grey.shade100,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: Text(menuEventList[index].name!,
                                style: boldTextStyle(
                                    color: index == activePageIndex
                                        ? buttoncolor
                                        : Colors.black54)),
                          ),
                        );
                      }),
                    ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              DouarsList(filter: "", zone: selectedZoneList == null ? selectedZoneList!.first.value.toString() : "0",),
                              DouarsList(filter: "urgent",zone: selectedZoneList == null ? selectedZoneList!.first.value.toString() : "0",),
                              DouarsList(filter: "needhelp",zone: selectedZoneList == null ? selectedZoneList!.first.value.toString() : "0",),
                              DouarsList(filter: "helped",zone: selectedZoneList == null ? selectedZoneList!.first.value.toString() : "0",),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }


}
