
import '../../data/model/travel_model.dart';

abstract class HomeState{

}
class HomeInitial extends HomeState{

}
class HomeLoading extends HomeState{

}
class HomeCompleted extends HomeState{

  List<TravelModel> response;
  HomeCompleted(this.response);
}