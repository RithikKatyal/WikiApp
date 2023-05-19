part of '../provider/home_bloc.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}
class InitialHomeState extends HomeState {

  InitialHomeState();

  @override
  List<Object> get props => [];
}
class LoadingHomeState extends HomeState {

  LoadingHomeState();

  @override
  List<Object> get props => [];
}
class LoadedHomeState extends HomeState {
  final WikiResults wikiResults;

  LoadedHomeState(this.wikiResults);

  @override
  List<Object> get props => [wikiResults];
}
class ErrorHomeState extends HomeState {

  ErrorHomeState();

  @override
  List<Object> get props => [];
}