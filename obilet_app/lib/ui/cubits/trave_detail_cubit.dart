


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilet_app/data/entity/seat_model.dart';
import 'package:obilet_app/ui/cubits/travel_detail_state.dart';

class TravelDetailCubit extends Cubit<TravelDetailState>{
  TravelDetailCubit():super(TravelDetailInitial());

  final collectionSeats = FirebaseFirestore.instance.collection("travels");
  var totalPrice = 0;
  Future<void> getSeats(String docId) async{
    final query = await collectionSeats.doc(docId).collection("seats").orderBy("seatNumber");
    query.snapshots().listen((event) {
      var seatList = <SeatModel>[];
      var docs = event.docs;
      for(var doc in docs){
        var data = doc.data();
        var key = doc.id;
        var seat = SeatModel.fromJson(data, key);
        seatList.add(seat);
      }
      emit(TravelDetailCompleted(response: seatList));
    });
  }

  bool isSeatSelected(SeatModel seat,List<SeatModel> selectedSeats) {
    return selectedSeats.contains(seat);
  }
  void seatRemove(SeatModel seat,List<SeatModel> selectedSeats,String seatPrice){
    selectedSeats.remove(seat);
    totalPrice = totalPrice - int.parse(seatPrice);
  }
  void seatAdd(SeatModel seat,List<SeatModel> selectedSeats,String seatPrice){
    selectedSeats.add(seat);
    totalPrice = totalPrice + int.parse(seatPrice);
  }
}

