
import 'package:dairyapp/Intro/Splashscreen.dart';
import 'package:get/get.dart';

import '../Pages/Home/HomeScreen.dart';
import '../Pages/Home/Tabs/SettingTab.dart';
import '../Pages/Home/Tabs/SettingTab/ChangePasswordScreen.dart';
import '../Pages/Home/Tabs/SettingTab/EditProfileScreen.dart';
import '../Pages/Home/Tabs/SettingTab/Privacypolicy.dart';
import '../Pages/Home/Tabs/SettingTab/help center/view/index.dart';
import '../Pages/Home/Tabs/SettingTab/terms&condition.dart';
import '../Pages/User/LoginScreen.dart';
import '../Pages/User/SignupScreen.dart';

class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => SplashScreen(),
      transition: Transition.fade,
    ),
   /* GetPage(
        name: '/onBoarding',
        page: ()=> OnboardingScreen(),
        transition: Transition.circularReveal),*/
    //Login
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
      transition: Transition.fadeIn,
    ),
    //forgotpassword
   /* GetPage(
        name: '/forgotpass',
        page: () =>ForotPasswordScreen(),
        transition: Transition.upToDown
    ),*/
    //Signup
    GetPage(
        name: '/signup',
        page: () =>SignupScreen(),
        transition: Transition.upToDown
    ),
    //Tabs
    GetPage(name: '/home',
        page: ()=>HomeScreen()),
   /* GetPage(name: '/chat',
        page: ()=>ChatScreen()),*/

     GetPage(name: '/setting',
        page:()=> SettingsTab()),

    //setting contents
    GetPage(name: '/editProfile',
        page: ()=>EditProfileScreen()),
    GetPage(name:'/changePassword' ,
        page: ()=>ChangePasswordScreen()),
    GetPage(name: '/termscnd',
        page:()=> TermsAndConditionsScreen()),
    GetPage(name:'/changePassword' ,
        page: ()=>ChangePasswordScreen()),
    GetPage(name:'/help&support' ,
        page: ()=>SupportView()),
    GetPage(
        name:'/pp' ,
        page: ()=> PrivacyPolicyScreen()),
  ];
}

