
class TravelModel{
  String arrival;
  String departure;
  String arrivalTime;
  String departureTime;
  String price;
  String companyName;
  String companyImage;
  String totalSeats;
  String busType;
  String docId;

  TravelModel(
      {required this.arrival,
      required this.departure,
      required this.arrivalTime,
      required this.departureTime,
      required this.price,
      required this.companyName,
      required this.companyImage,
      required this.totalSeats,
      required this.busType,
      required this.docId});
  factory TravelModel.fromJson(Map<dynamic,dynamic> json,String key){
    return TravelModel(arrival: json["arrival"],
        departure: json["departure"],
        arrivalTime: json["arrivalTime"],
        departureTime: json["departureTime"],
        price: json["price"],
        companyName: json["companyName"],
        companyImage: json["companyImage"],
        totalSeats: json["totalSeats"],
        busType: json["busType"],
        docId: json["docId"]
    );
  }
}