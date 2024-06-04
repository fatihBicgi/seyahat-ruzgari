


import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TravelInfoCubit extends Cubit<void>{
  TravelInfoCubit():super(0);

  final collectionTravel = FirebaseFirestore.instance.collection("travels");
  Future<void> updateTravel(String price,String arrivalTime,String departureTime,String date,String docId) async{
    var updateTravelInfos = HashMap<String,dynamic>();
    updateTravelInfos["price"] = price;
    updateTravelInfos["arrivalTime"] = arrivalTime;
    updateTravelInfos["departureTime"] = departureTime;
    updateTravelInfos["date"] = date;
    collectionTravel.doc(docId).update(updateTravelInfos);
  }

}