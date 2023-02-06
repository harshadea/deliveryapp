import 'package:flutter/material.dart';

Color primeryColor = Colors.white;
Color darkPrimeryColor = const Color(0xff2D2D3A);

Color cardColor = Colors.white;
Color darkcardColor = const Color(0xff3d3d4e);

Color textColor = const Color(0xff2D2D3A);
Color darktextColor = const Color(0xff2D2D3A);

Color proColor = const Color(0xff0065ff);
Color darkproColor = const Color(0xff0065ff);

Color preColor = const Color(0xff0065ff);
Color darkpreColor = Colors.white;

Color text1Color = const Color(0xff2D2D3A);
Color darktext1Color = const Color(0xffDADADA);

Color darkbColor = const Color(0xfff1f5f6);
Color bColor = const Color(0xff3d3d4e);

Color whiteColor = Colors.white;
Color darkwhiteColor = Colors.black;

Color textxcolor = const Color(0xffFE7058);
Color textssColor = Colors.white;

Color topColor = Colors.white;
Color darktopColor = const Color(0xff404052);

Color darkblackColor = Colors.black;
Color blackColor = Colors.white;

Color blueColor = const Color(0xfff8eae8);
Color darkblueColor = const Color(0xff0b0b0c);

Color orangeColor = const Color(0xfff1f5f6);
Color darkorangeColor = const Color(0xff393948);

Color pinkColor = const Color(0xfff0f0f0);
Color darkpinkColor = const Color(0xff393948);

Color darkColor = Colors.black;
Color lightColor = Colors.white;


class CustomColors {
  static Color primaryTextColor = Colors.white;
  static Color dividerColor = Colors.white54;
  static Color pageBackgroundColor = Color(0xFF2D2F41);
  static Color menuBackgroundColor = Color(0xFF242634);

  static Color clockBG = Color(0xFF444974);
  static Color clockOutline = Color(0xFFEAECFF);
  static Color? secHandColor = Colors.orange[300];
  static Color minHandStatColor = Color(0xFF748EF6);
  static Color minHandEndColor = Color(0xFF77DDFF);
  static Color hourHandStatColor = Color(0xFFC279FB);
  static Color hourHandEndColor = Color(0xFFEA74AB);
}

class GradientColors {
  final List<Color> colors;
  GradientColors(this.colors);

  static List<Color> sky = [Color(0xFF6448FE), Color(0xFF5FC6FF)];
  static List<Color> sunset = [Color(0xFFFE6197), Color(0xFFFFB463)];
  static List<Color> sea = [Color(0xFF61A3FE), Color(0xFF63FFD5)];
  static List<Color> mango = [Color(0xFFFFA738), Color(0xFFFFE130)];
  static List<Color> fire = [Color(0xFFFF5DCD), Color(0xFFFF8484)];
}

class GradientTemplate {
  static List<GradientColors> gradientTemplate = [
    GradientColors(GradientColors.sky),
    GradientColors(GradientColors.sunset),
    GradientColors(GradientColors.sea),
    GradientColors(GradientColors.mango),
    GradientColors(GradientColors.fire),
  ];
}

const kPrimaryColor = Color(0xFFA95EFA);
const kSecondaryColor = Color(0xFFF3F6F8);
const kTextColor = Color(0xFF171717);
const PrimaryColor = Color(0xFFFF7643);
const PrimaryLightColor = Color(0xFFFFECDF);
const PrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const SecondaryColor = Color(0xFF979797);
const TextColor = Color(0xFF757575);
const AnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: colors.black,
  height: 1.5,
);

//Form Error

final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9*]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String EmailNullError = "Please Enter Your Email";
const String INvalidEmailError = "Please Enter Valid Email";
const String PassNullError = "Please Enter Your Password";
const String ShortPassError = "Password is too short";
const String MatchPassError = "password don't Match";
const String NameNullError = "Please Enter your name";
const String PhoneNumberNullError = "Please Enter your name";
const String AddressNullError = "Please Enter your name";

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15),
  enabledBorder: OutlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  border: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: TextColor),
  );
}

extension colors on ColorScheme {
  static MaterialColor primaryApp = const MaterialColor(
    0xffF23436,
    <int, Color>{
      50: primary,
      100: primary,
      200: primary,
      300: primary,
      400: primary,
      500: primary,
      600: primary,
      700: primary,
      800: primary,
      900: primary,
    },
  );

  static const Color primary = Color(0xffF23436);
  static const Color secondary = Color(0xfffdc994);

  static const Color white = Color(0xffffffff);
  static const Color lightWhite = Color(0xffeef2f9);

  static const Color fontColor = Color(0xff222222);
  static const Color green = Color(0xff009245);
  static const Color blue = Color(0xff012afc);
  static const Color orange = Color(0xffee7e06);
  static const Color grey = Color(0xff808080);

  static const Color black = Color(0xff000000);
  static const Color lightBlack = Color(0xff52575c);

  Color get btnColor => brightness == Brightness.dark ? whiteTemp : primary;

  Color get cardColor =>
      brightness == Brightness.dark ? darkColor2 : const Color(0xffFFFFFF);

  Color get shadowColor =>
      brightness == Brightness.dark ? darkColor : const Color(0xff808080);

  Color get gray =>
      brightness == Brightness.dark ? darkColor3 : const Color(0xfff0f0f0);

  Color get simmerBase =>
      brightness == Brightness.dark ? darkColor2 : Colors.grey[300]!;

  Color get simmerHigh =>
      brightness == Brightness.dark ? darkColor : Colors.grey[100]!;

  static Color darkIcon = const Color(0xff9B9B9B);

  static const Color grad1Color = Color(0xffFFBD69);
  static const Color grad2Color = Color(0xffFF6363);
  static const Color lightWhite2 = Color(0xffEEF2F3);

  static const Color yellow = Color(0xfffdd901);

  static const Color red = Colors.red;

  Color get lightBlack2 =>
      brightness == Brightness.dark ? white70 : const Color(0xff999999);

  static const Color darkColor = Color(0xff17242B);
  static const Color darkColor2 = Color(0xff29414E);
  static const Color darkColor3 = Color(0xff22343C);

  static const Color whiteTemp = Color(0xffFFFFFF);

  static const Color white10 = Colors.white10;
  static const Color white30 = Colors.white30;
  static const Color white70 = Colors.white70;

  static const Color black54 = Colors.black54;
  static const Color black12 = Colors.black12;
  static const Color disableColor = Color(0xffEEF2F9);

  static const Color blackTemp = Color(0xff000000);

  Color get black26 => brightness == Brightness.dark ? white30 : Colors.black26;

  Color get back1 => brightness == Brightness.dark
      ? const Color(0xff1E3039)
      : const Color(0xffa2d8fe);

  Color get back2 => brightness == Brightness.dark
      ? const Color(0xff09202C)
      : const Color(0xffbdb1ff);

  Color get back3 => brightness == Brightness.dark
      ? const Color(0xff10101E)
      : const Color(0xffEFAFBF);

  Color get back4 => brightness == Brightness.dark
      ? const Color(0xff171515)
      : const Color(0xffF9DED7);

  Color get back5 => brightness == Brightness.dark
      ? const Color(0xff0F1412)
      : const Color(0xffC6F8E5);
}
