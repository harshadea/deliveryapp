import 'package:ecomikdeliveryapp/utils/constants/app_constants.dart';
import 'package:ecomikdeliveryapp/utils/constants/app_page_names.dart';
import 'package:ecomikdeliveryapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';

class PasswordChangSuccessScreen extends StatelessWidget {
  const PasswordChangSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* <-------- Empty appbar with back button --------> */
        appBar: CoreWidgets.appBarWidget(screenContext: context),
        /* <-------- Content --------> */
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppAssetImages.passwordChangeSuccessIllustration,
                    cacheHeight: (240 * 1.5).toInt(),
                    cacheWidth: (260 * 1.5).toInt(),
                    height: 240,
                    width: 260),
                AppGaps.hGap56,
                const HighlightAndDetailTextWidget(
                    isSpaceShorter: true,
                    slogan: 'Great! Password changed',
                    subtitle:
                        'Don\'t worry! We\'ll let you know if there is any '
                        'problem with your account'),
                AppGaps.hGap30,
              ],
            ),
          ),
        ),
        /* <-------- Bottom bar button --------> */
        bottomNavigationBar: CustomScaffoldBottomBarWidget(
          child: CustomStretchedTextButtonWidget(
              buttonText: 'Keep me logged in',
              onTap: () {
                Navigator.pushNamed(context, AppPageNames.homeScreen);
              }),
        ));
  }
}
