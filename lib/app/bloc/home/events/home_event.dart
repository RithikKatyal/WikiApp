part of '../provider/home_bloc.dart';


abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}


class SearchResultEvent extends HomeEvent {
  String title;
  SearchResultEvent(this.title);

  @override
  List<Object?> get props => [title];
}
