import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:nb_utils/nb_utils.dart' as nb;

import '../../models/douar.dart';
import '../../utils/consts.dart';

class DetailsDouar extends StatefulWidget {
  const DetailsDouar({super.key, required this.douar});

  final Datum douar;

  @override
  State<DetailsDouar> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsDouar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(

          child: SingleChildScrollView(

        child: Stack(
          children: [
            Container(
              height: size.height - 86,
              child: Column(

                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 10),
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: grey.withOpacity(0.03),
                            spreadRadius: 10,
                            blurRadius: 3,
                            // changes position of shadow
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 25, right: 20, left: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [GestureDetector(
                                onTap: (){
                                Get.back();
                                },
                                child: Icon(Icons.arrow_back_ios)), Icon(Icons.more_vert)],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://media-cdn.tripadvisor.com/media/photo-s/02/24/c6/e8/kasbah-de-talamanzou.jpg"),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: (size.width - 40) * 0.6,
                                child: Column(
                                  children: [
                                    Text(
                                      widget.douar.nomAr!,
                                      style: titleStyle,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      widget.douar.nomFr!,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: black),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    widget.douar.population.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: mainFontColor),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "الساكنة",
                                    style: subtitle,
                                  ),
                                ],
                              ),
                              Container(
                                width: 0.5,
                                height: 40,
                                color: black.withOpacity(0.3),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "5500",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: mainFontColor),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "الجرحى",
                                    style: subtitle,
                                  ),
                                ],
                              ),
                              Container(
                                width: 0.5,
                                height: 40,
                                color: black.withOpacity(0.3),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "890",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: mainFontColor),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "الوفيات",
                                    style: subtitle,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text("Sep 12, 2023",
                            style: tags),

                        Column(
                          children: [
                            Row(
                              children: [

                            IconBadge(
                                  icon: Icon(Icons.notifications_none),
                                  itemCount: 1,
                                  badgeColor: buttoncolor,
                                  itemColor: primary,
                                  hideZero: true,
                                  top: -1,
                                  onTap: () {
                                    print('test');
                                  },
                                ),
                                Text("الجمعيات",
                                    style: titleStyle),
                              ],
                            )
                          ],
                        ),
                        // Text("Overview",
                        //     style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 20,
                        //       color: mainFontColor,
                        //     )),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 20,
                                  left: 25,
                                  right: 25,
                                ),
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(25),
                                    boxShadow: [
                                      BoxShadow(
                                        color: grey.withOpacity(0.03),
                                        spreadRadius: 10,
                                        blurRadius: 3,
                                        // changes position of shadow
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, right: 20, left: 20),
                                  child: Row(
                                    children: [



                                      Expanded(
                                        child: Container(
                                          width: (size.width - 90) * 0.7,
                                          padding: EdgeInsets.symmetric(horizontal: 16),
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "جمعية التنمية",
                                                  style: subtitle,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "العنوان",
                                                  style: subtitle2,
                                                ),
                                              ]),
                                        ),
                                      ),
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: arrowbgColor,
                                          borderRadius: BorderRadius.circular(15),
                                          // shape: BoxShape.circle
                                        ),
                                        child: Center(
                                            child: Icon(Icons.arrow_upward_rounded)),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        const Text("Sep 12, 2023",
                            style: tags),

                        Column(
                          children: [
                            Row(
                              children: [
                                IconBadge(
                                  icon: Icon(Icons.place_outlined),
                                  itemCount: 1,
                                  badgeColor: buttoncolor,
                                  itemColor: primary,
                                  hideZero: true,
                                  top: -1,
                                  onTap: () {
                                    print('test');
                                  },
                                ),
                                const Text("جهات الاتصال",
                                    style: titleStyle),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),




                ],
              ),
            ),

            Positioned(
              bottom: 0,
              left: 16,
              right: 16,
              child: nb.AppButton(
                text: 'تحديت',
                textStyle: titleStyle,
                color: Colors.white,
                onTap: () {
                  //ChoosePlanScreen().launch(context);
                  //Get.to(const ChatGPT3());
                  //_launchUniversalLinkIos(Uri.parse("https://my.um6p.ma"));
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
