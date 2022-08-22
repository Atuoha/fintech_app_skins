import 'package:fintech_app_ui/screens/auth/forgot_password.dart';
import 'package:fintech_app_ui/screens/auth/signin.dart';
import 'package:fintech_app_ui/screens/auth/signup.dart';
import 'package:fintech_app_ui/screens/auth/verify.dart';
import 'package:fintech_app_ui/screens/main/bottom_nav.dart';
import 'package:fintech_app_ui/screens/other/add_new_card.dart';
import 'package:fintech_app_ui/screens/other/fund_wallet.dart';
import 'package:fintech_app_ui/screens/other/subscription_details.dart';
import 'package:fintech_app_ui/screens/other/withdraw.dart';
import 'package:fintech_app_ui/screens/splash/splash_screen.dart';

var routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  Signup.routeName: (context) => const Signup(),
  VerificationScreen.routeName: (context) => const VerificationScreen(),
  Signin.routeName: (context) => const Signin(),
  ForgotPassword.routeName: (context) => const ForgotPassword(),
  BottomNav.routeName: (context) => const BottomNav(),
  AddNewCard.routeName: (context) => const AddNewCard(),
  FundWallet.routeName: (context) => const FundWallet(),
  SubscriptionDetails.routeName: (context) => const SubscriptionDetails(),
  Withdraw.routeName: (context) => const Withdraw(),
};
