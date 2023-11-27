import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/att.dart';
import '../utils/constants.dart';
import 'custom_cart.dart';

class LatestAtt extends StatelessWidget {
  
  final List<Att> Atts = [
    Att(
      id: 507,
      deliveryAddress: "New Times Square",
      arrivalDate: DateTime.now(),
      titleCard: 'Attendance History',
      // placedDate: DateTime(2023, 1, 17),
      goNav: '',
      placedDate: DateTime.now(),
      status: AttStatus.DELIVERING,
      customIcon: Icon(
          Icons.punch_clock_rounded,
          color: Color.fromRGBO(0, 58, 125, 1),
        ),
      textActivity: [
        textRowBalance("Clock in", getFormat()),
        textRowBalance("Clock out", getFormat()),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          const SizedBox(
            height: 10.0,
          ),
          ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              // Lets pass the order to a new widget and render it there
              return CustomCard(
                att: Atts[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 15.0,
              );
            },
            itemCount: Atts.length,
          )
          // Let's create an order model
        ],
      ),
    );
  }
}

String getFormat(){
  final DateFormat formatter = DateFormat("dd MMM yyyy, HH:mm:ss");
  return formatter.format(DateTime.now());
}
