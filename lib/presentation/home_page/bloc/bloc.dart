import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/data/repositories/potter_repository.dart';
import 'package:flutter_test_app/presentation/home_page/bloc/events.dart';
import 'package:flutter_test_app/presentation/home_page/bloc/state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PotterRepository repo;

  HomeBloc(this.repo) : super(const HomeState()) {
    on<HomeLoadDataEvent>(_onLoadData);
  }

  void _onLoadData(HomeLoadDataEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(data: repo.loadData()));
  }
}
