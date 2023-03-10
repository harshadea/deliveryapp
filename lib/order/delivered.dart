
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/Orders/detailsorder.dart';
import '../utils/constants/colornotifire.dart';
import '../utils/constants/media.dart';
import '../utils/constants/string.dart';


class Delivered extends StatefulWidget {
  const Delivered({Key? key}) : super(key: key);

  @override
  State<Delivered> createState() => _DeliveredState();
}

class _DeliveredState extends State<Delivered> {
  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 60,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: notifire.getbcolor,
                      borderRadius: const BorderRadius.all(Radius.circular(15),),
                    ),
                    child: Column(
                      children: [
                        orders(
                          Text(
                            CustomStrings.delivered,
                            style: TextStyle(
                                color: const Color(0xff4BD37B),
                                fontFamily: 'Gilroy Bold',
                                fontSize: height / 47),
                          ),
                        ),
                        SizedBox(height: height / 100,),
                      ],
                    ),
                  ),
                  SizedBox(height: height / 60,),

                  Container(
                    decoration: BoxDecoration(
                      color: notifire.getbcolor,
                      borderRadius: const BorderRadius.all(Radius.circular(15),),
                    ),
                    child: Column(
                      children: [
                        orders(
                          Text(
                            CustomStrings.delivered,
                            style: TextStyle(
                                color: const Color(0xff4BD37B),
                                fontFamily: 'Gilroy Bold',
                                fontSize: height / 47),
                          ),
                        ),
                        SizedBox(height: height / 100,),
                      ],
                    ),
                  ),
                  SizedBox(height: height / 60,),
                  Container(
                    decoration: BoxDecoration(
                      color: notifire.getbcolor,
                      borderRadius: const BorderRadius.all(Radius.circular(15),),
                    ),
                    child: Column(
                      children: [
                        orders(
                          Text(
                            CustomStrings.delivered,
                            style: TextStyle(
                                color: const Color(0xff4BD37B),
                                fontFamily: 'Gilroy Bold',
                                fontSize: height / 47),
                          ),
                        ),
                        SizedBox(height: height / 100,),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: height / 30,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 60,
            ),
          ],
        ),
      ),
    );
  }
  Widget orders(se) {
    return GestureDetector(
      onTap: (){
        Get.to( const Boxdetails(CustomStrings.delivery,CustomStrings.pending),);
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(
              height: height / 40, 
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order #841565",
                      style: TextStyle(
                          color: notifire.getdarkscolor,
                          fontFamily: 'Gilroy Bold',
                          fontSize: height / 47),
                    ),
                    SizedBox(
                      height: height / 200,
                    ),
                    Text(
                      "11 Mar 2021 at 06:00 PM",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Gilroy Medium',
                          fontSize: height / 52),
                    ),
                    SizedBox(
                      height: height / 80,
                    ),
                    Row(
                      children: [
                        Text(
                          "20 Items",
                          style: TextStyle(
                              color: notifire.getdarkscolor,
                              fontFamily: 'Gilroy Bold',
                              fontSize: height / 47),
                        ),
                        SizedBox(
                          width: width / 2,
                        ),
                        Text(
                          "\$ 230",
                          style: TextStyle(
                              color: notifire.getprocolor,
                              fontFamily: 'Gilroy Bold',
                              fontSize: height / 47),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    se,
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height / 100,
            ),
          ],
        ),
      ),
    );
  }
}
