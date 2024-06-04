



import '../../data/entity/seat_model.dart';

abstract class TravelDetailState{
  const TravelDetailState();
}

class TravelDetailInitial extends TravelDetailState{
  const TravelDetailInitial();
}
class TravelDetailLoading extends TravelDetailState{
  const TravelDetailLoading();
}
class TravelDetailCompleted extends TravelDetailState{
  final List<SeatModel> response;
  const TravelDetailCompleted({required this.response});
}