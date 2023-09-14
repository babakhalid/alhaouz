import 'package:alhaouz/utils/consts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';


class ApiClient {
  final Dio _dio = Dio();


  Future<dynamic> registerUser(FormData data) async {
    try {
      Response response = await _dio.post(
          '${URL}api/register',
          data: data,
      );

      print(response.data);

      return response.data;

    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> getUser(String token) async {
    try {
      Response response = await _dio.post(
        '${URL}api/get_user',
        options: Options(
          headers: {'Authorization': 'bearer $token'},
        ),
      );

      print(response.data);

      return response.data;

    } on DioError catch (e) {
      return e.response!.data;
    }
  }









  Future<dynamic> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        '${URL}api/login',
        data: {
          'email': email,
          'password': password,
        },

      );
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

Future<dynamic> Booking(String type, String id_event) async {
    try {
      final box = GetStorage();
      String laiba = box.read("token");
      Response response = await _dio.post(
        '${URL}api/booking/put',
        data: {
          'type': type,
          'event_id': id_event,
        },
        options: Options(
          headers: {'Authorization': 'bearer $laiba'},
        ),

      );
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }





  Future<dynamic> logout(String accessToken) async {
    try {
      Response response = await _dio.post(
        '${URL}api/logout',
        data: {
          'token': accessToken,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static Future<bool> authenticateWithBiometrics() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    bool isAuthenticated = false;

    if (isBiometricSupported && canCheckBiometrics) {
      List<BiometricType> biometricTypes =
      await localAuthentication.getAvailableBiometrics();
      print(biometricTypes);

      isAuthenticated = await localAuthentication.authenticate(
        localizedReason: 'Please complete the biometrics to proceed.',
        options: const AuthenticationOptions(
          biometricOnly: true,

        )
        //biometricOnly: true,
        // androidAuthStrings: AndroidAuthMessages(
        //   biometricHint: 'Verify identity using biometrics',
        //   biometricRequiredTitle: 'Accessing secret vault',
        //   deviceCredentialsRequiredTitle:
        //       'Identity verification using biometrics is required to proceed to the secret vault.',
        // ),
      );
    }

    return isAuthenticated;
  }



}