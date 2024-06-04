


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilet_admin/ui/cubits/home_state.dart';

import '../../data/model/travel_model.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(HomeInitial());

  var travelCollection = FirebaseFirestore.instance.collection("travels");

  Future<void> getTravels() async{
    var travelQuery = travelCollection;
    emit(HomeLoading());
    Future.delayed(Duration(milliseconds: 1000));
    travelQuery.snapshots().listen((event) {
      var travelList = <TravelModel>[];
      var docs = event.docs;
      for(var document in docs){
        var data = document.data();
        var key = document.id;
        var travel = TravelModel.fromJson(data, key);
        travelList.add(travel);
      }
      emit(HomeCompleted(travelList));
    });
  }
  Future<void> deleteTravel(String docId)async {
    travelCollection.doc(docId).delete();
  }
}