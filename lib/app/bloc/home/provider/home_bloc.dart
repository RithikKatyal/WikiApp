
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiki_app/app/repository/home/home_repository.dart';
import 'package:wiki_app/app/repository/home/model/wiki_result.dart';
part '../events/home_event.dart';

part '../states/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository = HomeRepository();


  HomeBloc() : super(InitialHomeState()) {
    on<SearchResultEvent>(_onSearchResultEvent);
  }

  _onSearchResultEvent(SearchResultEvent event, emit) async {
    emit(LoadingHomeState());
    WikiResults? response =
    await _homeRepository.getSearchData(event.title);
    if(response!=null) {
      emit(LoadedHomeState(response));
    } else{
      emit(ErrorHomeState());
    }
  }
}
