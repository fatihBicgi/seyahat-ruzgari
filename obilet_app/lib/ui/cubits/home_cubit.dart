


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class HomeState{
  const HomeState();
}
class HomeInitial extends HomeState{
}
class HomeLoading extends HomeState{

}
class HomeCompleted extends HomeState{
  DateTime? time;
  HomeCompleted({required this.time});
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() :super(HomeInitial());

  DateTime? _selectedDate;
}