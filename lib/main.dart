import 'package:ecomikdeliveryapp/utils/app_routes.dart';
import 'package:ecomikdeliveryapp/utils/constants/app_page_names.dart';
import 'package:ecomikdeliveryapp/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const LaundryDelivery());
}

class LaundryDelivery extends StatelessWidget {
  const LaundryDelivery({Key? key}) : super(key: key);

  // This widget is the root of this app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laundry',
      onGenerateRoute: AppRouteGenerator.generateRoute,
      initialRoute: AppPageNames.rootScreen,
      theme: AppThemeData.appThemeData,
    );
  }
}
