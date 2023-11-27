import 'package:flutter/material.dart';

enum AttStatus { PICKING_UP, DELIVERING }

class Att {
  final int id;
  final AttStatus status;
  final DateTime arrivalDate;
  final DateTime placedDate;
  final String deliveryAddress;
  final String titleCard;
  final String goNav;
  final Icon customIcon;
  final List<Widget> textActivity;

  Att({
    required this.id,
    required this.status,
    required this.arrivalDate,
    required this.placedDate,
    required this.deliveryAddress,
    required this.titleCard,
    required this.goNav,
    required this.customIcon,
    required this.textActivity,
  });
}
