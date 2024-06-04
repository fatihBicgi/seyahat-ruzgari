

import 'package:flutter/material.dart';
import 'package:obilet_app/data/entity/travel_model.dart';

import '../../data/entity/seat_model.dart';

class Payment extends StatefulWidget {
  List<SeatModel> seats;
  TravelModel travel;
  Payment({super.key, required this.seats,required this.travel});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
