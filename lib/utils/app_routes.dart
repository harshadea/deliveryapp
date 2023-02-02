import 'package:ecomikdeliveryapp/screens/call_screen.dart';
import 'package:ecomikdeliveryapp/screens/chat_deliveryman_screen.dart';
import 'package:ecomikdeliveryapp/screens/congratulation_screen.dart';
import 'package:ecomikdeliveryapp/screens/delivered_success_screen.dart';
import 'package:ecomikdeliveryapp/screens/home_screen.dart';
import 'package:ecomikdeliveryapp/screens/intro_screen.dart';
import 'package:ecomikdeliveryapp/screens/langauge_screen.dart';
import 'package:ecomikdeliveryapp/screens/my_wallet_screen.dart';
import 'package:ecomikdeliveryapp/screens/notifications_screen.dart';
import 'package:ecomikdeliveryapp/screens/password_change_success_screen.dart';
import 'package:ecomikdeliveryapp/screens/password_recovery_screens/password_recovery_create_password_screen.dart';
import 'package:ecomikdeliveryapp/screens/password_recovery_screens/password_recovery_prompt_screen.dart';
import 'package:ecomikdeliveryapp/screens/password_recovery_screens/password_recovery_select_screen.dart';
import 'package:ecomikdeliveryapp/screens/password_recovery_screens/password_recovery_verification_screen.dart';
import 'package:ecomikdeliveryapp/screens/send_to_bank_screen.dart';
import 'package:ecomikdeliveryapp/screens/settings_screen.dart';
import 'package:ecomikdeliveryapp/screens/sign_in_screen.dart';
import 'package:ecomikdeliveryapp/screens/sign_up_screen.dart';
import 'package:ecomikdeliveryapp/screens/sign_up_success_screen.dart';
import 'package:ecomikdeliveryapp/screens/splash_screen.dart';
import 'package:ecomikdeliveryapp/utils/constants/app_page_names.dart';
import 'package:ecomikdeliveryapp/screens/insight_screen.dart';
import 'package:flutter/material.dart';

/// This file contains app route generator
class AppRouteGenerator {
  /// This function generate routes corresponding to their pages with parameters
  /// (if used)
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final Object? argument = settings.arguments;
    switch (settings.name) {
      case AppPageNames.rootScreen:
      case AppPageNames.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppPageNames.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case AppPageNames.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case AppPageNames.signUpSuccessScreen:
        return MaterialPageRoute(builder: (_) => const SignUpSuccessScreen());
      case AppPageNames.passwordChangeSuccessScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordChangSuccessScreen());
      case AppPageNames.passwordRecoveryPromptScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordRecoveryPromptScreen());
      case AppPageNames.passwordRecoveryVerificationScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordRecoveryVerificationScreen());
      case AppPageNames.passwordRecoverySelectScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordRecoverySelectScreen());
      case AppPageNames.passwordRecoveryCreateScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordRecoveryCreatePasswordScreen());
      case AppPageNames.notificationsScreen:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case AppPageNames.settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case AppPageNames.languageScreen:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      case AppPageNames.myWalletScreen:
        return MaterialPageRoute(builder: (_) => const MyWalletScreen());
      case AppPageNames.chatWithDeliverymanScreen:
        return MaterialPageRoute(builder: (_) => const ChatDeliverymanScreen());
      case AppPageNames.congratulationScreen:
        return MaterialPageRoute(builder: (_) => const CongratulationScreen());
      case AppPageNames.insightScreen:
        return MaterialPageRoute(builder: (_) => const InsightScreen());
      case AppPageNames.sendToBankScreen:
        return MaterialPageRoute(builder: (_) => const SendToBankScreen());
      case AppPageNames.deliveredSuccessScreen:
        return MaterialPageRoute(
            builder: (_) => const DeliveredSuccessScreen());
      case AppPageNames.callScreen:
        return MaterialPageRoute(builder: (_) => const CallScreen());
      case AppPageNames.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        // Open this page if wrong route address used
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                body: SafeArea(child: Center(child: Text('Page not found')))));
    }
  }
}
