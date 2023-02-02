import 'dart:ui';

import 'package:ecomikdeliveryapp/models/enums.dart';
import 'package:ecomikdeliveryapp/models/fake_data.dart';
import 'package:ecomikdeliveryapp/utils/constants/app_constants.dart';
import 'package:ecomikdeliveryapp/utils/constants/app_page_names.dart';
import 'package:ecomikdeliveryapp/widgets/core_widgets.dart';
import 'package:ecomikdeliveryapp/widgets/screen_widgets/home_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Bottom slider panel controller
  final PanelController _panelController = PanelController();

  /// Global of home scaffold key for opening drawer
  final GlobalKey<ScaffoldState> _homeScaffoldKey = GlobalKey<ScaffoldState>();

  /// Current status
  HomeScreenStatus _currentHomeScreenStatus = HomeScreenStatus.offline;

  /// Get screen appbar title
  String _getScreenTitle() {
    switch (_currentHomeScreenStatus) {
      case HomeScreenStatus.offline:
        return 'You\'re offline';
      default:
        return 'New delivery task';
    }
  }

  /// Get bottom bar text
  String _getBottomButtonText() {
    switch (_currentHomeScreenStatus) {
      case HomeScreenStatus.offline:
      case HomeScreenStatus.online:
        return 'Accept delivery';
      case HomeScreenStatus.newTask:
        return 'Mark as picked';
      case HomeScreenStatus.pickedTask:
        return 'Mark as delivered';
      default:
        return 'Accept delivery';
    }
  }

  /// Get gps up arrow button
  Widget _getGPSUpArrowButton() {
    if (_currentHomeScreenStatus == HomeScreenStatus.newTask ||
        _currentHomeScreenStatus == HomeScreenStatus.pickedTask) {
      return CustomIconButtonWidget(
        onTap: () {},
        fixedSize: const Size(34, 34),
        backgroundColor: AppColors.primaryColor,
        hasShadow: true,
        isCircleShape: true,
        child: SvgPicture.asset(AppAssetImages.gpsUpArrowSVGLogoLine,
            color: Colors.white),
      );
    } else {
      return AppGaps.emptyGap;
    }
  }

  /// Get customer message and call buttons row
  Widget _getCustomerMessageCallButtons() {
    if (_currentHomeScreenStatus == HomeScreenStatus.newTask ||
        _currentHomeScreenStatus == HomeScreenStatus.pickedTask) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppGaps.wGap5,
          CustomIconButtonWidget(
              fixedSize: const Size(20, 20),
              onTap: () {
                Navigator.pushNamed(
                    context, AppPageNames.chatWithDeliverymanScreen);
              },
              child: SvgPicture.asset(AppAssetImages.messageSVGLogoLine,
                  color: AppColors.primaryColor)),
          AppGaps.wGap24,
          CustomIconButtonWidget(
              fixedSize: const Size(20, 20),
              onTap: () {
                Navigator.pushNamed(context, AppPageNames.callScreen);
              },
              child: SvgPicture.asset(AppAssetImages.callingSVGLogoLine,
                  color: AppColors.primaryColor)),
        ],
      );
    } else {
      return AppGaps.emptyGap;
    }
  }

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
    final screenSize = MediaQuery.of(context).size;
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
          titleWidget: Text(_getScreenTitle()),
          /* <---- Offline / online status change toggle button ----> */
          actions: [
            Center(
              child: FlutterSwitch(
                value: _currentHomeScreenStatus != HomeScreenStatus.offline,
                width: 35,
                height: 20,
                toggleSize: 12,
                activeColor: AppColors.successColor,
                inactiveColor: AppColors.alertColor,
                onToggle: (value) async {
                  switch (_currentHomeScreenStatus) {
                    case HomeScreenStatus.offline:
                      await _panelController.show();
                      setState(() =>
                          _currentHomeScreenStatus = HomeScreenStatus.online);
                      break;
                    case HomeScreenStatus.online:
                      await _panelController.hide();
                      setState(() =>
                          _currentHomeScreenStatus = HomeScreenStatus.offline);
                      break;
                    default:
                  }
                },
              ),
            ),
            AppGaps.wGap20,
          ]),
      /* <-------- Drawer --------> */
      drawer: Stack(
        clipBehavior: Clip.none,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3.05,
              sigmaY: 3.05,
            ),
            child: const SizedBox.expand(),
          ),
          const Drawer(
            backgroundColor: AppColors.primaryColor,
            child: DrawerList(),
          )
        ],
      ),
      /* <-------- Content --------> */
      body: SlidingUpPanel(
        controller: _panelController,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        backdropEnabled: true,
        backdropColor: AppColors.lineShapeColor,
        margin: const EdgeInsets.only(left: 24, right: 24, bottom: 15),
        backdropOpacity: 0.8,
        boxShadow: const [],
        color: Colors.transparent,
        minHeight: 200,
        /* <---- Bottom slider top notch portion ----> */
        header: SizedBox(
          width: screenSize.width - 48,
          height: 100,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                  top: 12,
                  child: SvgPicture.asset(AppAssetImages.slideUpPanelNotchSVG,
                      color: Colors.white)),
              Positioned(
                  top: 22,
                  child: SvgPicture.asset(
                    AppAssetImages.arrowUpSVGLogoLine,
                    color: AppColors.primaryColor.withOpacity(0.5),
                    width: 40,
                  ))
            ],
          ),
        ),
        /* <---- Bottom slider bottom button portion ----> */
        footer: _currentHomeScreenStatus != HomeScreenStatus.offline
            ? Container(
                width: screenSize.width - 48,
                height: 65 + 24,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
                child: CustomStretchedTextButtonWidget(
                  buttonText: _getBottomButtonText(),
                  onTap: () {
                    switch (_currentHomeScreenStatus) {
                      case HomeScreenStatus.online:
                        setState(() => _currentHomeScreenStatus =
                            HomeScreenStatus.newTask);
                        break;
                      case HomeScreenStatus.newTask:
                        setState(() => _currentHomeScreenStatus =
                            HomeScreenStatus.pickedTask);
                        break;
                      case HomeScreenStatus.pickedTask:
                        Navigator.pushNamed(
                            context, AppPageNames.deliveredSuccessScreen);
                        break;
                      default:
                        setState(() => _currentHomeScreenStatus =
                            HomeScreenStatus.newTask);
                    }
                  },
                ))
            : null,
        /* <---- Bottom slider content ----> */
        panelBuilder: (sc) => Container(
          margin: const EdgeInsets.only(top: 24),
          padding: const EdgeInsets.only(top: 30),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: CustomScrollView(controller: sc, slivers: [
            /* <---- First product image and name row ----> */
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 24,
                      backgroundImage:
                          Image.asset(AppAssetImages.reviewer1Image).image),
                  AppGaps.wGap16,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Beats Headphone',
                        style: Theme.of(context).textTheme.button,
                      ),
                      AppGaps.hGap8,
                      const Text(
                        '13.4km (20 min)',
                        style: TextStyle(color: AppColors.bodyTextColor),
                      ),
                    ],
                  )),
                  _getGPSUpArrowButton(),
                ],
              ),
            )),
            const SliverToBoxAdapter(child: AppGaps.hGap32),
            /* <---- Shopkeeper name ----> */
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 34,
                    width: 34,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 6),
                              color: AppColors.primaryColor.withOpacity(0.35),
                              blurRadius: 15)
                        ]),
                    child: SvgPicture.asset(AppAssetImages.locationSVGLogoLine,
                        height: 18, width: 18, color: Colors.white),
                  ),
                  AppGaps.wGap16,
                  Expanded(
                      child: Text(
                    'John Smith Doe',
                    style: Theme.of(context).textTheme.button,
                  )),
                  _getCustomerMessageCallButtons()
                ],
              ),
            )),
            /* <---- Shopkeeper address ----> */
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(left: 40),
                padding: const EdgeInsets.only(left: 34),
                decoration: const BoxDecoration(
                    border: Border(
                        left: BorderSide(color: AppColors.primaryColor))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Dumbo Street, New York, USA',
                        style: TextStyle(color: AppColors.bodyTextColor),
                      ),
                      AppGaps.hGap10,
                    ],
                  ),
                ),
              ),
            ),
            /* <---- Customer name ----> */
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 34,
                    width: 34,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 6),
                              color: AppColors.primaryColor.withOpacity(0.35),
                              blurRadius: 15)
                        ]),
                    child: SvgPicture.asset(AppAssetImages.mapSVGLogoLine,
                        height: 18, width: 18, color: Colors.white),
                  ),
                  AppGaps.wGap16,
                  Expanded(
                      child: Text(
                    'Jessica Herry',
                    style: Theme.of(context).textTheme.button,
                  ))
                ],
              ),
            )),
            /* <---- Customer address ----> */
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 74),
                child: Text(
                  'Dumbo Street, New York, USA',
                  style: TextStyle(color: AppColors.bodyTextColor),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: AppGaps.hGap24),
            /* <---- Horizontal dashed line ----> */
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: CustomHorizontalDashedLineWidget(
                    color: AppColors.lineShapeColor),
              ),
            ),
            const SliverToBoxAdapter(child: AppGaps.hGap24),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'Order info',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: AppGaps.hGap16),
            /* <---- Delivering product list ----> */
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              /// Single product
              final product = FakeData.products[index];
              return DeliveryProductListTile(
                productImage: product.productImage,
                name: product.name,
                itemCount: 2,
                priceText: product.price,
              );
            }, childCount: FakeData.products.length)),
            const SliverToBoxAdapter(child: AppGaps.hGap24),
            /* <---- 'Cash on delivery' and price text row ----> */
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Cash on delivery',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(r'$286.00',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            )),
            // Bottom spaces (24 for extra spaces)
            const SliverToBoxAdapter(child: SizedBox(height: 150 + 24)),
          ]),
        ),
        /* <---- Actual content ----> */
        body: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  alignment:
                      _currentHomeScreenStatus == HomeScreenStatus.offline
                          ? Alignment.topCenter
                          : Alignment.center,
                  /* <---- Demo map location background image ----> */
                  image: Image.asset(
                          _currentHomeScreenStatus == HomeScreenStatus.offline
                              ? AppAssetImages.offlineMapBackgroundDemoImage
                              : AppAssetImages.deliveryInfoBackgroundDemoImage)
                      .image)),
        ),
      ),
    );
  }
}
