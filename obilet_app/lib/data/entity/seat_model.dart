
import 'dart:collection';

class SeatModel{
  String seatNumber;
  String status;
  SeatModel({required this.seatNumber,required this.status});

  factory SeatModel.fromJson(Map<dynamic,dynamic> json,String key){
    return SeatModel(seatNumber: json["seatNumber"], status: json["status"]);
  }
}