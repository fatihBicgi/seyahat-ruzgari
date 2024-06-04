
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilet_app/ui/cubits/trave_state.dart';
import 'package:obilet_app/data/entity/travel_model.dart';

class TravelCubit extends Cubit<TravelState>{
  TravelCubit():super(TravelInitial());

  var travelCollection = FirebaseFirestore.instance.collection("travels");
  Future<void> getTravels(String departure,String arrival,String date) async{
    var travelQuery = travelCollection.where("departure",isEqualTo: departure).where("arrival",isEqualTo: arrival).where("date",isEqualTo: date);
    emit(TravelLoading());
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
      emit(TravelCompleted(response: travelList));
    });
  }
  Future<void> getTravelsByCompany(String companyName) async{
    var query = travelCollection.where("companyName",isEqualTo: companyName);
    query.snapshots().listen((event) {
      var travelList = <TravelModel>[];
      var docs = event.docs;
      for(var document in docs){
        var data = document.data();
        var key = document.id;
        var travel = TravelModel.fromJson(data, key);
        travelList.add(travel);
      }
      emit(TravelCompleted(response: travelList));
    });
  }

  Future<void> sortByDescPrice(String departure,String arrival) async{
    var travelQuery = travelCollection.where("departure",isEqualTo: departure).where("arrival",isEqualTo: arrival).orderBy("price",descending: true);
    travelQuery.snapshots().listen((event) {
      var travelList = <TravelModel>[];
      var docs = event.docs;
      for(var document in docs){
        var data = document.data();
        var key = document.id;
        var travel = TravelModel.fromJson(data,key);
        travelList.add(travel);
      }
      emit(TravelCompleted(response: travelList));
    });
  }
  Future<void> sortByAscPrice(String departure,String arrival) async{
    var travelQuery = travelCollection.where("departure",isEqualTo: departure).where("arrival",isEqualTo: arrival).orderBy("price");
    travelQuery.snapshots().listen((event) {
      var travelList = <TravelModel>[];
      var docs = event.docs;
      for(var document in docs){
        var data = document.data();
        var key = document.id;
        var travel = TravelModel.fromJson(data,key);
        travelList.add(travel);
      }
      emit(TravelCompleted(response: travelList));
    });
  }
  Future<void> sortByAscDate(String departure,String arrival) async{
    var travelQuery = travelCollection.where("departure",isEqualTo: departure).where("arrival",isEqualTo: arrival).orderBy("departureTime");
    travelQuery.snapshots().listen((event) {
      var travelList = <TravelModel>[];
      var docs = event.docs;
      for(var document in docs){
        var data = document.data();
        var key = document.id;
        var travel = TravelModel.fromJson(data,key);
        travelList.add(travel);
      }
      emit(TravelCompleted(response: travelList));
    });
  }
  Future<void> sortByDescDate(String departure,String arrival) async{
    var travelQuery = travelCollection.where("departure",isEqualTo: departure).where("arrival",isEqualTo: arrival).orderBy("departureTime",descending: true);
    travelQuery.snapshots().listen((event) {
      var travelList = <TravelModel>[];
      var docs = event.docs;
      for(var document in docs){
        var data = document.data();
        var key = document.id;
        var travel = TravelModel.fromJson(data,key);
        travelList.add(travel);
      }
      emit(TravelCompleted(response: travelList));
    });
  }
}