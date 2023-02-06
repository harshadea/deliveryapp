import 'package:ecomikdeliveryapp/utils/constants/colornotifire.dart';
import 'package:ecomikdeliveryapp/utils/constants/media.dart';
import 'package:ecomikdeliveryapp/utils/constants/string.dart';
import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {

  late ColorNotifire notifire;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: order(notifire: notifire),
      ),
    );
  }
}

class order extends StatelessWidget {
  const order({
    super.key,
    required this.notifire,
  });

  final ColorNotifire notifire;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.pushReplacement(
                //   context,
                //   PageTransition(
                //     type: PageTransitionType.fade,
                //     child: const Bottom(),
                //   ),
                // );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border:
                      Border.all(color: const Color(0xfff1f5f6), width: 2),
                  color: Colors.transparent,
                ),
                height: 19,
                width: 8,
                child: const Center(
                    child: Icon(Icons.arrow_back_ios_outlined)),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              CustomStrings.myorder,
              style: TextStyle(
                  color: notifire.getdarkscolor,
                  fontFamily: 'Gilroy Bold',
                  fontSize: height / 43),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          color: Colors.transparent,
          height: MediaQuery.of(context).size.height / 1.27,
          width: MediaQuery.of(context).size.width,
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    // color: notifire.getbcolor,
                  ),
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: const TabBar(
                    // unselectedLabelColor: notifire.getprocolor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      // color: notifire.getprocolor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          // child: Text(CustomStrings.all),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          // child: Text(CustomStrings.progress),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          // child: Text(CustomStrings.delivered),
                        ),
                      ),
                    ],
                  ),
                ),
                // const Expanded(
                //   child: TabBarView(
                //     children: <Widget>[
                //       All(),
                //       Progresse(),
                //       Delivered(),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
