import 'package:ecomikdeliveryapp/utils/constants/app_constants.dart';
import 'package:ecomikdeliveryapp/utils/constants/app_page_names.dart';
import 'package:ecomikdeliveryapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /* <---- Congratulation illustration ----> */
              Image.asset(AppAssetImages.congratulationIllustration,
                  height: 272),
              AppGaps.hGap56,
              const HighlightAndDetailTextWidget(
                  slogan: 'Congratulations',
                  subtitle: 'Don\'t worry! We\'ll let you know if there is any '
                      'problem with your account'),
              // Bottom extra spaces
              AppGaps.hGap30,
            ],
          ),
        )),
      ),
      /* <-------- Bottom bar --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
        child: CustomStretchedTextButtonWidget(
            buttonText: 'Go to home',
            onTap: () {
              Navigator.pushNamed(context, AppPageNames.homeScreen,
                  arguments: 0);
            }),
      ),
    );
  }
}
