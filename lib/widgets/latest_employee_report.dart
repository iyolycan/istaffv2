import 'package:flutter/material.dart';

import '../models/att.dart';
import '../utils/constants.dart';
import 'custom_cart.dart';

class LatestEmployeeReport extends StatelessWidget {
  final List<Att> Atts = [
    Att(
      id: 507,
      deliveryAddress: "New Times Square",
      arrivalDate: DateTime.now(),
      titleCard: '',
      // placedDate: DateTime(2023, 1, 17),
      placedDate: DateTime.now(),
      status: AttStatus.DELIVERING,
      goNav: '/DetailEmpReports',
      customIcon: Icon(
          Icons.people,
          color: Color.fromRGBO(43, 46, 49, 1),
        ),
      textActivity: [
       textRowBalance('Budi Susanto', 'Sick Leave'),
       textRowBalance('Fahmi Nur Afif', 'Annual Leave'),
       textRowBalance('Annisa Nurahma', 'Annual Leave'),
       textRowBalance('Larasati', 'Annual Leave'),
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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Daily Employee Report",
                  style: TextStyle(
                    color: Color.fromRGBO(19, 22, 33, 1),
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    color: Constants.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
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
