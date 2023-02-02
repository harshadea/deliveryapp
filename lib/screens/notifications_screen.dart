import 'package:ecomikdeliveryapp/models/fake_data.dart';
import 'package:ecomikdeliveryapp/utils/constants/app_constants.dart';
import 'package:ecomikdeliveryapp/widgets/core_widgets.dart';
import 'package:ecomikdeliveryapp/widgets/screen_widgets/notifications_screen_widgets.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      /* <-------- Empty appbar with back button --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context, titleWidget: const Text('Notification')),
      /* <-------- Content --------> */
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top extra spaces
          AppGaps.hGap80,
          /* <---- Notification list ----> */
          Expanded(
            /* <---- Notification list with date category ----> */
            child: ListView.separated(
                itemCount: FakeData.fakeNotificationDateGroups.length,
                padding: const EdgeInsets.only(bottom: 30, top: 24),
                separatorBuilder: (context, outerIndex) => const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppGaps.screenPaddingValue),
                      child: Divider(height: 32),
                    ),
                itemBuilder: (context, outerIndex) {
                  /// Single notification category
                  final notificationDateGroup =
                      FakeData.fakeNotificationDateGroups[outerIndex];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppGaps.screenPaddingValue),
                        child: Text(notificationDateGroup.dateHumanReadableText,
                            style: Theme.of(context).textTheme.button),
                      ),
                      AppGaps.hGap24,
                      /* <---- Notification list under a date 
                               category ----> */
                      ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const ClampingScrollPhysics(),
                        separatorBuilder: (context, index) => AppGaps.hGap24,
                        itemCount: FakeData
                            .fakeNotificationDateGroups[outerIndex]
                            .groupNotifications
                            .length,
                        itemBuilder: (context, index) {
                          /// Single notification
                          final notification = FakeData
                              .fakeNotificationDateGroups[outerIndex]
                              .groupNotifications[index];
                          return SingleNotificationWidget(
                              onDelete: () {},
                              index: index,
                              notification: notification);
                        },
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
