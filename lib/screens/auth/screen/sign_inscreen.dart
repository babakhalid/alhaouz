import 'package:alhaouz/screens/auth/model/signin_user.dart';
import 'package:alhaouz/screens/auth/network/api_client.dart';
import 'package:alhaouz/screens/home/home_screen2.dart';
import 'package:alhaouz/utils/consts.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ms_undraw/ms_undraw.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  final box = GetStorage();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ApiClient _apiClient = ApiClient();
  bool _showPassword = true;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  SignInUser? user;
  Future<void> login() async {
    if (_formKey.currentState!.validate()) {

      if(box.read("deleted") != null){

        Get.snackbar('Account deleted',
            'Your account no longer exists ',
            backgroundColor: Colors.redAccent,
            icon: Icon(AntDesign.deleteuser, color: Colors.white,),
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);

      }else{

        Get.snackbar('Loading',
            'Preparing the future...',
            backgroundColor: Colors.green,
            icon: Icon(AntDesign.loading1, color: Colors.white,),
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);



        dynamic res = await _apiClient.login(
          emailController.text,
          passwordController.text,
        );


        ScaffoldMessenger.of(context).hideCurrentSnackBar();

        if (res['success'] == true) {
          user = SignInUser.fromJson(res);
          String accessToken = user!.token!;
          //save data to GetX

          box.write('token', user!.token);
          box.write('id', user!.user!.id!);
          box.write('email', user!.user!.email);
          box.write('name', user!.user!.name);
          //box.write('phone', user!.user!.phone);
          box.write('type', user!.user!.type);
          box.write('organisme', user!.user!.organisme);
          box.write("code", user!.user!.code);

          print(accessToken);




          ///Subscription to topics

         /* for(final e in res['topics']){

            //
            //var currentElement = e;
            print("Topics : "+ e);
            await FirebaseMessaging.instance.subscribeToTopic(e);
          }*/

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Home()));



          /* Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BiometricSignIn(accessToken: accessToken)));*/

        } else {

          Get.snackbar('Please verify',
              '${res['message']}',
              backgroundColor: Colors.redAccent,
              icon: Icon(AntDesign.arrowup, color: Colors.white,),
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM);


        }
      }


    }else{
      Get.snackbar('Error',
          'Verify your email or/and password',
          backgroundColor: Colors.redAccent,
          icon: Icon(AntDesign.arrowup, color: Colors.white,),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController(text: box.read('email') ?? "");
    passwordController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;



    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: UpgradeAlert(
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.034,
                    left: screenWidth * 0.079,
                    right: screenWidth * 0.079),
                child: SingleChildScrollView(
                  child: Stack(
                      children: [
                    Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.022,
                        ),
                        SizedBox(
                          height: screenHeight * 0.36,
                          width: screenWidth * 0.80,
                          child: UnDraw(
                            color: buttoncolor,
                            illustration: UnDrawIllustration.access_account,
                            placeholder: Text("Illustration is loading..."), //optional, default is the CircularProgressIndicator().
                            errorWidget: Icon(Icons.error_outline, color: Colors.red, size: 50), //optional, default is the Text('Could not load illustration!').
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.04,
                        ),
                        Text(
                          'Sign In',
                          style: TextStyle(
                              fontFamily: 'Quicksand-SemiBold',
                              fontSize: screenHeight * 0.0215,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: screenHeight * 0.045,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: screenWidth * 0.126),
                          child: Wrap(
                            children: [
                              Text(
                                '',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Quicksand-Regular',
                                  fontSize: screenHeight * 0.019,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(99, 99, 99, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.039,
                        ),
                        SizedBox(
                          height: screenHeight * 0.056,
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (!GetUtils.isEmail(value!))
                                return "Email is not valid";
                              else
                                return null;
                            },
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,

                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04,
                                  vertical: screenHeight * 0.015),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Color(0XFFE0E0E0)),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Color(0XFFE0E0E0)),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                fontFamily: 'Quicksand-Regular',
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(166, 157, 157, 1),
                                fontSize: screenHeight * 0.015,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.011,
                        ),
                        SizedBox(
                          height: screenHeight * 0.056,
                          child: TextFormField(

                            controller: passwordController,
                            obscureText: _showPassword,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04,
                                  vertical: screenHeight * 0.015),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Color(0XFFE0E0E0)),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Color(0XFFE0E0E0)),
                                  borderRadius: BorderRadius.circular(8)),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontFamily: 'Quicksand-Regular',
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(166, 157, 157, 1),
                                fontSize: screenHeight * 0.015,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _showPassword
                                      ? MaterialIcons.visibility_off
                                      : Icons.visibility_outlined,
                                  color: buttoncolor,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),



                        AppButton(
                          width: MediaQuery.of(context).size.width * 0.8,
                          text: 'Sign in',
                          textStyle: titleStyle,
                          color: buttoncolor,
                          onTap: () {
                            print(emailController.text);
                            print(passwordController.text);
                            login();
                          },
                        ),
                       /* PrimaryButton(
                          onPress: () {
                            print(emailController.text);
                            print(passwordController.text);
                            login();
                            //Navigator.pushNamed(context, '/third');
                            //Navigator.pushNamed(context, '/otp');
                          },
                          label: 'Sign in',
                        ),*/
                      ],
                    ),
                    /*const Positioned(
                      top: 0.0,
                      left: 0.0,
                      child: GoBackButton2(routeName: '/')
                    )*/
                  ]),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(bottom: screenHeight * 0.067),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                GestureDetector(
                  child: Text(
                    'Register',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Quicksand-Semibold',
                        fontWeight: FontWeight.w800,
                        fontSize: screenHeight * 0.017,
                        color: buttoncolor),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
