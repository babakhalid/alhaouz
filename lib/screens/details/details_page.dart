import 'dart:async';

import 'package:alhaouz/screens/forms/update_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:nb_utils/nb_utils.dart' as nb;
import 'package:url_launcher/url_launcher.dart';

import '../../models/douar.dart';
import '../../utils/consts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;

import 'add_association.dart';




class DetailsDouar extends StatefulWidget {
  const DetailsDouar({super.key, required this.douar});

  final Datum douar;

  @override
  State<DetailsDouar> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsDouar> {

  Completer<gm.GoogleMapController> _controller = Completer();

  static gm.LatLng? _center =  gm.LatLng(30.919704, -8.4376005);
  final gm.MapType _currentMapType = gm.MapType.satellite;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      _center =  gm.LatLng( double.parse(widget.douar.longitude!),double.parse(widget.douar.latitude!));

  }

  void _onMapCreated(gm.GoogleMapController controller) {
    _controller.complete(controller);
  }


  openMapsSheet(context) async {
    try {
      final coords = Coords( double.parse(widget.douar.longitude!), double.parse(widget.douar.latitude!));
      final title = widget.douar.nomFr;
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title!,
                        ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(

          child: SingleChildScrollView(

        child: Container(
          height: size.height,
          width: size.width,

          child: Stack(
            children: [
              Positioned(
                top: 16,
                right: 16,
                width: size.width,
                height: size.height,
                child: SingleChildScrollView(
                  child: Container(
                    //height: size.height,
                    margin: EdgeInsets.only(bottom: 124),
                    padding: EdgeInsets.only(bottom: 26),
                    child: Column(

                      children: [
                        Padding(
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
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    height: 150,

                                    decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        /*image: DecorationImage(
                                            image: NetworkImage(
                                                "https://media-cdn.tripadvisor.com/media/photo-s/02/24/c6/e8/kasbah-de-talamanzou.jpg"),
                                            fit: BoxFit.cover)*/
                                    ),
                                    child: gm.GoogleMap(

                                      onMapCreated: _onMapCreated,
                                      initialCameraPosition: gm.CameraPosition(
                                        target: _center!,
                                        zoom: 11.0,
                                      ),
                                      mapType: _currentMapType,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                      onTap:(){
                                        print("waze");
                                        openMapsSheet(context);
                                      },
                                    child: Container(
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
                                        "XX",
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
                                        "XX",
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
                        SizedBox(
                          height: 10,
                        ),
                        // Association and Add button
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AddAssociationDialog(),
                                  );
                                },
                                child: Container(
                                  width: 40, // Adjust size as required
                                  height: 40, // Adjust size as required
                                  decoration: BoxDecoration(
                                    //color: buttoncolor, // Using your buttonColor for background
                                    shape: BoxShape.circle,
                                    border: Border.all(color: buttoncolor, width: 2.0), // Adding a border with primary color
                                  ),
                                  child: Center(
                                    child: Icon(Icons.add, color: buttoncolor), // Icon color can be changed as needed
                                  ),
                                ),
                              ),

                              Column(
                                children: [
                                  Row(
                                    children: [
                                  IconBadge(
                                        icon: Icon(Icons.notifications_none),
                                        itemCount: widget.douar.contacts!.length,
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
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        //list association
                        widget.douar.associations!.isEmpty ? Container() :
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: widget.douar.associations!.length,
                              itemBuilder: (BuildContext context, int index) {
                                var getListData = widget.douar.associations![index];
                                return Container(
                                  height: 100,
                                  width: 100,
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
                                                        width: (size.width) * 0.7,
                                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                                        child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment.end,
                                                            children: [
                                                              Text(
                                                                getListData.nameFr!,
                                                                style: subtitle,
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                getListData.adresse!,
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
                                );
                              },
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

                              InkWell(
                                onTap: () {
                                  // Your action here
                                },
                                child: Container(
                                  width: 40, // Adjust size as required
                                  height: 40, // Adjust size as required
                                  decoration: BoxDecoration(
                                    //color: buttoncolor, // Using your buttonColor for background
                                    shape: BoxShape.circle,
                                    border: Border.all(color: buttoncolor, width: 2.0), // Adding a border with primary color
                                  ),
                                  child: Center(
                                    child: Icon(Icons.add, color: buttoncolor), // Icon color can be changed as needed
                                  ),
                                ),
                              ),

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


                        SizedBox(
                          height: 10,
                        ),

                        //list contacts
                        widget.douar.contacts!.isEmpty ? Container() :
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: widget.douar.contacts!.length,
                              itemBuilder: (BuildContext context, int index) {
                                var getListData = widget.douar.contacts![index];
                                return Container(
                                  height: 100,
                                  width: 100,
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
                                                        width: (size.width) * 0.7,
                                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                                        child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment.end,
                                                            children: [
                                                              Text(
                                                                getListData.nameFr!,
                                                                style: subtitle,
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                getListData.phone1!,
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
                                );
                              },
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

                              InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  width: 40, // Adjust size as required
                                  height: 40, // Adjust size as required
                                  decoration: BoxDecoration(
                                    //color: buttoncolor, // Using your buttonColor for background
                                    shape: BoxShape.circle,
                                    border: Border.all(color: buttoncolor, width: 2.0), // Adding a border with primary color
                                  ),
                                  child: Center(
                                    child: Icon(Icons.add, color: buttoncolor), // Icon color can be changed as needed
                                  ),
                                ),
                              ),

                              Column(
                                children: [
                                  Row(
                                    children: [
                                      IconBadge(
                                        icon: Icon(Icons.notifications_none),
                                        itemCount: widget.douar.contacts!.length,
                                        badgeColor: buttoncolor,
                                        itemColor: primary,
                                        hideZero: true,
                                        top: -1,
                                        onTap: () {
                                          print('test');
                                        },
                                      ),
                                      Text("الحاجيات",
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
                ),
              ),

              const Positioned(
                bottom: 0,
                left: 16,
                right: 16,
                child: ButtonUpdate(),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
