import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';

import '../consts.dart';



Map buildHeader() {
  return {
    'Content-Type': 'application/json',
  };
}

Future<Response> getRequest(String endPoint) async {
  try {
    if (!await isNetworkAvailable()) throw noInternetMsg;

    String url = "$URL$endPoint";

    Response response = await get(Uri.parse(url)).timeout(Duration(seconds: timeoutDuration), onTimeout: (() => throw "Please try again"));

    print('Code: ${response.statusCode} $url');
    print(response.body);
    return response;
  } catch (e) {
    print(e);
    if (!await isNetworkAvailable()) {
      throw noInternetMsg;
    } else {
      throw "Please try again";
    }
  }
}

Future<Response> postRequest(String endPoint, body) async {
  try {
    if (!await isNetworkAvailable()) throw noInternetMsg;

    String url = "$URL$endPoint";
    //Get the token
    final box = GetStorage();
    String laiba = box.read("token");


    //dio.post();
    Response response = await post(Uri.parse(url), body: body, headers: {'Authorization': 'bearer $laiba'}).timeout(Duration(seconds: timeoutDuration), onTimeout: (() => throw "Please try again"));

    print('Status: ${response.statusCode} $url $body');
    print(response.body);
   /*if(response.statusCode == 401){
      //token expired
     print("token expired");
     getx.Get.offAll(() => const LoginScreen());
    }*/
    return response;
  } catch (e) {
    print(e);
    if (!await isNetworkAvailable()) {
      throw noInternetMsg;
    } else {
      throw "Please try again";
    }
  }
}


Future<Response> putRequest(String endPoint, body) async {
  try {
    if (!await isNetworkAvailable()) throw noInternetMsg;

    String url = "$URL$endPoint";

    print('URL: $url');
    print('Request: $body');

    Response response = await put(Uri.parse(url), body: jsonEncode(body)).timeout(Duration(seconds: timeoutDuration), onTimeout: (() => throw "Please try again"));

    print('Status: ${response.statusCode} $url $body');
    print(response.body);
    return response;
  } catch (e) {
    print(e);
    if (!await isNetworkAvailable()) {
      throw noInternetMsg;
    } else {
      throw "Please try again";
    }
  }
}

Future<Response> deleteRequest(String endPoint) async {
  try {
    if (!await isNetworkAvailable()) throw noInternetMsg;

    String url = '$URL$endPoint';

    Response response = await post(Uri.parse(url)).timeout(Duration(seconds: timeoutDuration), onTimeout: (() => throw "Please try again"));

    print('Code: ${response.statusCode} $url');
    print(response.body);
    return response;
  } catch (e) {
    print(e);
    if (!await isNetworkAvailable()) {
      throw noInternetMsg;
    } else {
      throw "Please try again";
    }
  }
}

Future handleResponse(Response response) async {
  final box = GetStorage();

  if (response.statusCode.isSuccessful()) {
    final data = jsonDecode(response.body);

    // Store data locally in case app is backgrounded
    await box.write('storedData', data);

    return data;
  } else {
    if (response.body.isJson()) {
      throw jsonDecode(response.body);
    } else {
      if (!await isNetworkAvailable()) {
        throw noInternetMsg;
      } else {
        // Check if there's stored data
        final storedData = box.read('storedData');
        if (storedData != null) {
          return storedData;
        } else {
          throw 'Please try again';
        }
      }
    }
  }
}