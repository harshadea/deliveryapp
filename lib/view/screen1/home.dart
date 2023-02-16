import 'dart:ui';

import 'package:ecomikdeliveryapp/models/enums.dart';
import 'package:ecomikdeliveryapp/utils/constants/app_constants.dart';
import 'package:ecomikdeliveryapp/utils/constants/app_page_names.dart';
import 'package:ecomikdeliveryapp/widgets/core_widgets.dart';
import 'package:ecomikdeliveryapp/widgets/screen_widgets/home_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../utils/constants/colornotifire.dart';
import '../../utils/constants/string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ColorNotifire notifire;

  /// Bottom slider panel controller
  final PanelController _panelController = PanelController();

  /// Global of home scaffold key for opening drawer
  final GlobalKey<ScaffoldState> _homeScaffoldKey = GlobalKey<ScaffoldState>();

  /// Current status
  final HomeScreenStatus _currentHomeScreenStatus = HomeScreenStatus.offline;




  /* <-------- Initial state --------> */
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_currentHomeScreenStatus == HomeScreenStatus.offline &&
          _panelController.isAttached &&
          _panelController.isPanelShown) {
        await _panelController.hide();
        if (mounted) {
          setState(() {});
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Get screen size
    return Scaffold(
      key: _homeScaffoldKey,
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context,
          hasBackButton: false,
          /* <---- Show drawer button ----> */
          leading: Center(
            child: CustomIconButtonWidget(
                onTap: () {
                  if (_homeScaffoldKey.currentState != null &&
                      !_homeScaffoldKey.currentState!.isDrawerOpen) {
                    _homeScaffoldKey.currentState?.openDrawer();
                  }
                },
                hasShadow: true,
                child: SvgPicture.asset(
                  AppAssetImages.menuSVGLogoLine,
                  color: AppColors.darkColor,
                  height: 12,
                  width: 12,
                )),
          ),
          titleWidget: SizedBox(
              height: 66,
              width: 66,
              child: Image.asset('assets/images/delivery.png')),
          /* <---- Offline / online status change toggle button ----> */
          actions: [
            Center(
              child: CustomIconButtonWidget(
                hasShadow: true,
                child: Center(
                    child: IconButton(
                        icon: const Icon(Icons.notifications_none,
                            color: Colors.black),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppPageNames.notificationsScreen);
                          }
                        )),
              ),
            ),
            AppGaps.wGap20,
          ]),
      /* <-------- Drawer --------> */
      drawer: Stack(
        clipBehavior: Clip.none,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.05, sigmaY: 3.05),
            child: const SizedBox.expand(),
          ),
          const Drawer(
            backgroundColor: AppColors.primaryColor,
            child: DrawerList(),
          )
        ],
      ),
      /* <-------- Content --------> */
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                height: 131,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /* <---- Orders total data widget ----> */
                        Container(
                          height: 131,
                          width: 130,
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.topLeft,
                          decoration: const BoxDecoration(
                              color: Color(0xFFFBEFE2),
                              borderRadius: BorderRadius.all(
                                  AppComponents.defaultBorderRadius)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomIconButtonWidget(
                                  borderRadiusRadiusValue:
                                      const Radius.circular(8),
                                  backgroundColor: AppColors.secondaryColor,
                                  child: SvgPicture.asset(
                                    AppAssetImages.cartSVGLogoLine,
                                    color: Colors.white,
                                  )),
                              AppGaps.hGap16,
                              Text(
                                '45',
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              AppGaps.hGap4,
                              Text(
                                'Orders',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(color: AppColors.bodyTextColor),
                              )
                            ],
                          ),
                        ),
                        AppGaps.wGap16,
                        /* <---- Ride total data widget ----> */
                        Container(
                          height: 131,
                          width: 130,
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.topLeft,
                          decoration: const BoxDecoration(
                              color: Color(0xFFEEECFA),
                              borderRadius: BorderRadius.all(
                                  AppComponents.defaultBorderRadius)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomIconButtonWidget(
                                  borderRadiusRadiusValue:
                                      const Radius.circular(8),
                                  backgroundColor: AppColors.primaryColor,
                                  child: SvgPicture.asset(
                                    AppAssetImages.cartSVGLogoLine,
                                    color: Colors.white,
                                  )),
                              AppGaps.hGap16,
                              Text(
                                '68km',
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              AppGaps.hGap4,
                              Text(
                                'Ride',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(color: AppColors.bodyTextColor),
                              )
                            ],
                          ),
                        ),
                        AppGaps.wGap16,
                        /* <---- Earning total data widget ----> */
                        Container(
                          height: 131,
                          width: 130,
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.topLeft,
                          decoration: const BoxDecoration(
                              color: Color(0xFFE7F5FD),
                              borderRadius: BorderRadius.all(
                                  AppComponents.defaultBorderRadius)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomIconButtonWidget(
                                  borderRadiusRadiusValue:
                                      const Radius.circular(8),
                                  backgroundColor: AppColors.tertiaryColor,
                                  child: SvgPicture.asset(
                                    AppAssetImages.walletSVGLogoDualTone,
                                    color: Colors.white,
                                  )),
                              AppGaps.hGap16,
                              Text(
                                '\$238.00',
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              AppGaps.hGap4,
                              Text(
                                'Earnings',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(color: AppColors.bodyTextColor),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            const SizedBox(height: 22),
            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height / 1.27,
              width: MediaQuery.of(context).size.width,
              child: DefaultTabController(
                length: 3,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          color: Colors.blueGrey.shade50,
                        ),
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: TabBar(
                          unselectedLabelColor: Colors.black,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            color: Colors.green.shade400,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          tabs: const [
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(CustomStrings.all),
                              ),
                            ),
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(CustomStrings.progress),
                              ),
                            ),
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(CustomStrings.delivered),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const Expanded(
                      //   flex: 1,
                      //   child: TabBarView(
                      //     children: <Widget>[
                      //       All(),
                      //       Progresse(),
                      //       Delivered(),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: ListView.builder(
                            itemCount: 9,
                            itemBuilder: (context, int index) {
                              return Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Container(
                                    height: 155,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blueGrey.shade50),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(() => const HomeScreen());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 8),
                                            const Text('Order #841565',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17)),
                                            const SizedBox(height: 5),
                                            const Text(
                                              '11 Mar 2021 at 06:00 PM',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 12),
                                            Row(
                                              children: const [
                                                Text(
                                                  '20 Items',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Spacer(flex: 3),
                                                Expanded(
                                                    child: Text(
                                                  '\$ 230',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.green),
                                                )),
                                              ],
                                            ),
                                            const SizedBox(height: 12),
                                            Container(
                                              height: 33,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.red)),
                                              child: const Center(
                                                child: Text(
                                                  'Track Order',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.red,
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
