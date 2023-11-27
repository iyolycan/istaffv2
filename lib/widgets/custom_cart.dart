import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../models/att.dart';
import '../utils/helper.dart';

class CustomCard extends StatelessWidget {
  final Att att;

  CustomCard({required this.att});

  // For formatting date
  final DateFormat formatter = DateFormat("dd MMM yyyy, HH:mm:ss");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(att.goNav.isNotEmpty){
          nextScreen(context, att.goNav);
        }
      },
      child: Container(
        // height: ScreenUtil().setHeight(121.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: const Color.fromRGBO(220, 233, 245, 1),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getOrderIconWidget(att.customIcon),
            const SizedBox(
              width: 25.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  att.titleCard != '' ? Text(
                    att.titleCard,
                    style: const TextStyle(
                      color: Color.fromRGBO(19, 22, 33, 1),
                      fontSize: 16.0,
                    ),
                  ): Container(),
                  ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0.0,
                      vertical: 8.0,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      // Lets pass the order to a new widget and render it there
                      return att.textActivity[index];
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 5.0,
                      );
                    },
                    itemCount: att.textActivity.length,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget textRow(String textOne, String textTwo) {
  return Wrap(
    children: [
      Text(
        "$textOne:",
        style: const TextStyle(
          color: Color.fromRGBO(74, 77, 84, 0.7),
          fontSize: 14.0,
        ),
      ),
      const SizedBox(
        width: 4.0,
      ),
      Text(
        textTwo,
        style: const TextStyle(
          color: Color.fromRGBO(19, 22, 33, 1),
          fontSize: 14.0,
        ),
      ),
    ],
  );
}

Widget textRowBalance(String textOne, String textTwo) {
  return  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "$textOne:",
       style: const TextStyle(
          color: Color.fromRGBO(74, 77, 84, 0.7),
          fontSize: 14.0,
        ),
      ),
      Text(
        textTwo,
        style: const TextStyle(
          color: Color.fromRGBO(19, 22, 33, 1),
          fontSize: 14.0,
        ),
      )
    ],
  );
}

Widget getOrderIconWidget(Icon customIcon) {
  return Container(
        width: ScreenUtil().setWidth(37.0),
        height: ScreenUtil().setHeight(37.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(253, 182, 128, 1)),
        child: customIcon
      );
}

String getAttStatusText(AttStatus status) {
  switch (status) {
    case AttStatus.DELIVERING:
      return "Attendance History";
    case AttStatus.PICKING_UP:
      return "Attendance History";
    default:
      return "";
  }
}
