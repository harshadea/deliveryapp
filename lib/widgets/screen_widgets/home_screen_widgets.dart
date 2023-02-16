import 'package:ecomikdeliveryapp/screens/sign_in_screen.dart';
import 'package:ecomikdeliveryapp/utils/constants/app_constants.dart';
import 'package:ecomikdeliveryapp/utils/constants/app_page_names.dart';
import 'package:ecomikdeliveryapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

/// Drawer content list widgets
class DrawerList extends StatelessWidget {
  const DrawerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppGaps.screenPaddingValue),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppGaps.hGap20,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomIconButtonWidget(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      backgroundColor: Colors.white.withOpacity(0.1),
                      child: SvgPicture.asset(
                        AppAssetImages.closeSVGLogoLine,
                        color: Colors.white,
                      )),
                ],
              ),
              AppGaps.hGap20,
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                CircleAvatar(
                    backgroundImage: Image.asset(
                      AppAssetImages.myAccountProfilePicture,
                    ).image,
                    radius: 44),
                AppGaps.wGap24,
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Samantha Smith',
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(color: Colors.white),
                      ),
                      AppGaps.hGap10,
                      /* <---- Profile phone number ----> */
                      Text('+1 283 390 390',
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.7))),
                      AppGaps.hGap5,
                      /* <---- Profile email address ----> */
                      Text('samanthasmith@gmail.com',
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.7))),
                    ],
                  ),
                )
              ]),
              AppGaps.hGap48,
              /* <---- Notification drawer menu button ----> */
              DrawerMenuWidget(
                  text: 'Notification',
                  localAssetIconName:
                      AppAssetImages.notificationSVGLogoDualTone,
                  onTap: () {
                    Navigator.pushNamed(
                        context, AppPageNames.notificationsScreen);
                  }),
              AppGaps.hGap24,

              /* <---- Insight drawer menu button ----> */
              DrawerMenuWidget(
                  text: 'Insight',
                  localAssetIconName: AppAssetImages.chartSVGLogoDualTone,
                  onTap: () {
                    Navigator.pushNamed(context, AppPageNames.insightScreen);
                  }),
              AppGaps.hGap24,
              DrawerMenuWidget(
                  text: 'Orders',
                  localAssetIconName: AppAssetImages.orderSVGLogoDualTone,
                  onTap: () {
                    Navigator.pushNamed(context, AppPageNames.homeScreen);
                  }),
              AppGaps.hGap24,
              /* <---- Wallet drawer menu button ----> */
              DrawerMenuWidget(
                  text: 'My wallet',
                  localAssetIconName: AppAssetImages.walletSVGLogoDualTone,
                  onTap: () {
                    Navigator.pushNamed(context, AppPageNames.myWalletScreen);
                  }),
              AppGaps.hGap24,
              /* <---- Review drawer menu button ----> */
              DrawerMenuWidget(
                  text: 'My review',
                  localAssetIconName: AppAssetImages.starBlowingSVGLogoDualTone,
                  onTap: () {}),
              AppGaps.hGap24,
              /* <---- Terms and conditions drawer menu button ----> */
              DrawerMenuWidget(
                  text: 'Terms and conditions',
                  localAssetIconName: AppAssetImages.noteSVGLogoDualTone,
                  onTap: () {}),
              AppGaps.hGap24,
              /* <---- Setting drawer menu button ----> */
              DrawerMenuWidget(
                  text: 'Setting',
                  localAssetIconName: AppAssetImages.settingSVGLogoDualTone,
                  onTap: () {
                    Navigator.pushNamed(context, AppPageNames.settingsScreen);
                  }),
              AppGaps.hGap24,
              /* <---- Support drawer menu button ----> */
              DrawerMenuWidget(
                  text: 'Support',
                  localAssetIconName: AppAssetImages.sendSVGLogoDualTone,
                  onTap: () {}),
              AppGaps.hGap24,
              /* <---- Sign out drawer menu button ----> */
              DrawerMenuWidget(
                  text: 'Sign out',
                  localAssetIconName: AppAssetImages.logoutSVGLogoDualTone,
                  onTap: () {
                    Get.to(() => const SignInScreen());
                  }),
              // Bottom extra spaces
              AppGaps.hGap50,
            ],
          ),
        ),
      ),
    );
  }
}

/// Single drawer menu widget
class DrawerMenuWidget extends StatelessWidget {
  final String text;
  final String localAssetIconName;
  final void Function()? onTap;
  const DrawerMenuWidget({
    Key? key,
    required this.text,
    required this.localAssetIconName,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomRawListTileWidget(
        onTap: onTap,
        borderRadiusRadiusValue: const Radius.circular(14),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomIconButtonWidget(
              fixedSize: const Size(48, 48),
              backgroundColor: Colors.white.withOpacity(0.1),
              child: SvgPicture.asset(
                localAssetIconName,
                color: Colors.white,
                height: 24,
                width: 24,
              ),
            ),
            AppGaps.wGap16,
            Expanded(
              child: Text(text,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600)),
            ),
            Transform.scale(
                scaleX: -1,
                child: SvgPicture.asset(AppAssetImages.arrowLeftSVGLogoLine,
                    color: Colors.white.withOpacity(0.6))),
          ],
        ));
  }
}

/// Delivery single product details list tile
class DeliveryProductListTile extends StatelessWidget {
  final ImageProvider<Object> productImage;
  final String name;
  final int itemCount;
  final String priceText;
  const DeliveryProductListTile({
    Key? key,
    required this.productImage,
    required this.name,
    required this.itemCount,
    required this.priceText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, bottom: 16, right: 24),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                image: DecorationImage(image: productImage, fit: BoxFit.cover)),
          ),
          AppGaps.wGap8,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
              AppGaps.hGap8,
              Text('$itemCount items',
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        color: AppColors.bodyTextColor,
                      )),
            ],
          )),
          Text(
            '\$$priceText',
            style: const TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
