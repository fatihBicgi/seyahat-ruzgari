


import 'package:equatable/equatable.dart';
import 'package:obilet_app/data/entity/profile_model.dart';

class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState{
  const ProfileInitial();
}
class ProfileLoading extends ProfileState{
  const ProfileLoading();
}
class ProfileCompleted extends ProfileState {
  final ProfileModel response;
  const ProfileCompleted({required this.response});
  @override
  List<Object?> get props => [response];
}
class ProfileError extends ProfileState {
  final String errorMessage;

  const ProfileError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}