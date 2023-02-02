import 'package:ecomikdeliveryapp/models/fake_models/notification_model.dart';
import 'package:ecomikdeliveryapp/utils/constants/app_constants.dart';
import 'package:ecomikdeliveryapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Single notification list tile widget
class SingleNotificationWidget extends StatelessWidget {
  final FakeNotificationModel notification;
  final int index;
  final void Function()? onDelete;
  const SingleNotificationWidget({
    Key? key,
    required this.notification,
    required this.index,
    this.onDelete,
  }) : super(key: key);

  TextStyle? _getTextStyle(FakeNotificationTextModel notificationText) {
    if (notificationText.isBoldText) {
      return const TextStyle(fontWeight: FontWeight.w600);
    } else if (notificationText.isHashText) {
      return const TextStyle(
          color: AppColors.primaryColor, fontWeight: FontWeight.w600);
    } else if (notificationText.isColoredText) {
      return const TextStyle(color: AppColors.primaryColor);
    } else {
      return null;
    }
  }

  Widget _getNotificationContentWidget(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppGaps.screenPaddingValue),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: notification.image, fit: BoxFit.cover)),
          ),
          AppGaps.wGap16,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          // color: notification.isRead ? AppColors.bodyTextColor : AppColors.darkColor,
                          color: AppColors.bodyTextColor,
                          height: 1.5),
                      children: notification.texts
                          .map((notificationText) => TextSpan(
                              text: notificationText.text,
                              style: _getTextStyle(notificationText)))
                          .toList()),
                ),
                AppGaps.hGap8,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(notification.name,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(fontWeight: FontWeight.w500)),
                    Text(notification.timeText,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(color: AppColors.bodyTextColor)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(index),
      endActionPane: ActionPane(
          extentRatio: 0.35,
          motion: const ScrollMotion(),
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppGaps.wGap16,
                Material(
                  color: AppColors.primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    onTap: onDelete,
                    child: Container(
                        width: 80,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          AppAssetImages.deleteSVGLogoLine,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            )
          ]),
      child: notification.isRead
          ? CustomRawListTileWidget(
              onTap: () {},
              child: _getNotificationContentWidget(context),
            )
          : CustomListTileWidget(
              onTap: () {},
              paddingValue: const EdgeInsets.symmetric(
                  vertical: AppGaps.screenPaddingValue),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: _getNotificationContentWidget(context)),
    );
  }
}
