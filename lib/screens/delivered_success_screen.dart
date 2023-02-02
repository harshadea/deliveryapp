import 'package:ecomikdeliveryapp/utils/constants/app_constants.dart';
import 'package:ecomikdeliveryapp/utils/constants/app_page_names.dart';
import 'package:ecomikdeliveryapp/widgets/core_widgets.dart';
import 'package:ecomikdeliveryapp/widgets/screen_widgets/delivered_success_screen_widgets.dart';
import 'package:flutter/material.dart';

class DeliveredSuccessScreen extends StatelessWidget {
  const DeliveredSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
        screenContext: context,
        hasBackButton: false,
      ),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /* <---- Add review illustration ----> */
              Image.asset(AppAssetImages.deliveredSuccessIllustration,
                  height: 240),
              AppGaps.hGap56,
              const HighlightAndDetailTextWidget(
                  slogan: 'Delivered successfully!',
                  subtitle:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry'),
              AppGaps.hGap32,
              /* <---- Delivered success distance statistics ----> */
              DeliveredSuccessDetailWidget(
                  detailTitle: 'You drived',
                  detailText: '20 min (2.8 km)',
                  buttonText: 'View order info',
                  onTextButtonTap: () {},
                  iconLocalAssetName:
                      AppAssetImages.locationRoutingSVGLogoLine),
              AppGaps.hGap24,
              /* <---- Delivered success earning statistics ----> */
              DeliveredSuccessDetailWidget(
                  detailTitle: 'Your earning',
                  detailText: '\$ 3.38',
                  buttonText: 'View earnings',
                  onTextButtonTap: () {},
                  iconLocalAssetName: AppAssetImages.walletEmptySVGLogoLine),
              // Bottom extra spaces
              AppGaps.hGap30,
            ],
          ),
        )),
      ),
      /* <-------- Bottom bar --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
        child: CustomStretchedTextButtonWidget(
            buttonText: 'Back to home',
            onTap: () {
              Navigator.pushNamed(context, AppPageNames.homeScreen);
            }),
      ),
    );
  }
}
