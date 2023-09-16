import 'package:alhaouz/models/menu.dart';
import 'package:flutter/material.dart';

import '../models/filter.dart';

const Color primary = Color(0xfffafafa);
const Color secondary = Color(0xFFdbe4f3);
const Color black = Color(0xFF000000);
const Color white = Color(0xFFFFFFFF);
const Color grey = Colors.grey;
const Color red = Color(0xFFec5766);
const Color green = Color(0xFF43aa8b);
const Color blue = Color(0xFF28c2ff);
const Color buttoncolor = Color(0xff398480);
const Color mainFontColor = Color(0xff398480);
const Color arrowbgColor = Color(0xffe4e9f7);

const String URL = "https://api.alhaouz.org/";
const noInternetMsg = 'Oops No Internet';
const int timeoutDuration = 60;

const titleStyle = TextStyle(
    fontFamily: 'SSTARABIC',
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: mainFontColor);
const tags = TextStyle(
    fontFamily: 'SSTARABIC',
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
    color: mainFontColor);

const subtitle = TextStyle(
    fontFamily: 'SSTARABIC',
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    color: mainFontColor);

const subtitle2 = TextStyle(
    fontFamily: 'SSTARABIC',
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
    color: black);

const titleStyle2 = TextStyle(
    fontFamily: 'SSTARABIC',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: mainFontColor);

const buttonwhite = TextStyle(
    fontFamily: 'SSTARABIC',
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
    color: primary);

List<MenuEvent> menuEventList = [
  MenuEvent(name: 'الكل',),
  MenuEvent(name: '⚡ إحتياج عاجل',),
  MenuEvent(name: '⭐ في حاجة'),
  MenuEvent(name: '❤️ تمت المساعدة',),
];

List<Filter> zoneList = [
  Filter(value: "0 - 10km_zone d'impact direct", categorie: "zone", name:'0 - 10Km'),
  Filter(value: "10-30Km zone a risque tres eleve", categorie: "zone", name: "10-30Km"),
  Filter(value: "30-50 zone a risque élevé", categorie: "zone", name: "30-50Km"),
  Filter(value: "50 -100 zone a risque modere", categorie: "zone", name: "50 -100Km"),
];