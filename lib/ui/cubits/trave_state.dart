
import 'package:obilet_app/data/entity/travel_model.dart';

abstract class TravelState {
  const TravelState();
}
 class TravelInitial extends TravelState{
   const TravelInitial();
 }
 class TravelLoading extends TravelState{
  const TravelLoading();
 }
 class TravelCompleted extends TravelState{
  final List<TravelModel> response;
  const TravelCompleted({required this.response});
 }

