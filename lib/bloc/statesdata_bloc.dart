import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid19_stats/models/statesModel.dart';
import 'package:covid19_stats/repository/stateRepo.dart';
import 'package:equatable/equatable.dart';

part 'statesdata_event.dart';
part 'statesdata_state.dart';

class StatesdataBloc extends Bloc<StatesdataEvent, StatesdataState> {
  StateRepo repository;

  StatesdataBloc({this.repository}) : super(StatesdataInitial());
  StatesdataState get initialState => StatesdataInitial();
  @override
  Stream<StatesdataState> mapEventToState(
    StatesdataEvent event,
  ) async* {
    if (event is FetchDataEvent) {
      yield StatesdataLoading();
      try {
        List<Statewise> stateData = await repository.getStateData();
        yield StatesdataLoaded(list: stateData);
      } catch (e) {
        yield StatesdataError(msg: e.toString());
      }
    }
  }
}
