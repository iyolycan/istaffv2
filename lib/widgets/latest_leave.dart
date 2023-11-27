import 'package:flutter/material.dart';

import '../models/att.dart';
import '../utils/constants.dart';
import 'custom_cart.dart';

class LatestLeave extends StatelessWidget {
  final List<Att> Atts = [
    Att(
      id: 507,
      deliveryAddress: "New Times Square",
      arrivalDate: DateTime.now(),
      titleCard: 'Leave History',
      // placedDate: DateTime(2023, 1, 17),
      goNav: '',
      placedDate: DateTime.now(),
      status: AttStatus.DELIVERING,
      customIcon: Icon(
          Icons.timer_off_rounded,
          color: Color.fromRGBO(43, 46, 49, 1),
        ),
      textActivity: [
        textRowBalance("Annual Leave", '2 days'),
        textRowBalance("Sick Leave", '1 days'),
        textRowBalance("Maternity Leave", '1 days'),
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
