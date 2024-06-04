


import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilet_admin/data/model/travel_model.dart';

class AddTravelCubit extends Cubit<void>{
  AddTravelCubit():super(0);
  final collectionTravel = FirebaseFirestore.instance.collection("travels");

  Future<void> addTravel(TravelModel model) async {
    if (model.price == 0 ||
        model.departureTime.isEmpty ||
        model.arrivalTime.isEmpty ||
        model.departure.isEmpty ||
        model.arrival.isEmpty ||
        model.companyName.isEmpty ||
        model.companyImage.isEmpty ||
        model.totalSeats == 0 ||
        model.date.isEmpty) {
      print('Gerekli alanlardan biri boş, kayıt yapılmadı.');
    }

    var add = HashMap<String, dynamic>();
    add["price"] = model.price;
    add["departureTime"] = model.departureTime;
    add["arrivalTime"] = model.arrivalTime;
    add["departure"] = model.departure;
    add["arrival"] = model.arrival;
    add["companyName"] = model.companyName;
    add["companyImage"] = model.companyImage;
    add["busType"] = "2+1";
    add["totalSeats"] = model.totalSeats;
    add["date"] = model.date;
    add["docId"] = "";

    DocumentReference docRef = await collectionTravel.add(add);

    String docId = docRef.id;

    await docRef.update({"docId": docId});

    CollectionReference seatsCollection = docRef.collection('seats');

    var seats = int.parse(model.totalSeats);
    for (int i = 1; i <= seats; i++) {
      await seatsCollection.add({
        "seatNumber": i,
        "status": "available",
      });
    }
  }
}