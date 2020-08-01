import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid19_stats/models/statesModel.dart';
import 'package:covid19_stats/repository/stateRepo.dart';
import 'package:equatable/equatable.dart';

part 'statesdata_event.dart';
part 'statesdata_state.dart';

// Create bloc
class StatesdataBloc extends Bloc<StatesdataEvent, StatesdataState> {
  StateRepo repository;
// pass repo object to the constructor and define first state as InitialState
  StatesdataBloc({this.repository}) : super(StatesdataInitial());
  @override
//  define all the states and event define in the event and state files
  Stream<StatesdataState> mapEventToState(
    StatesdataEvent event,
  ) async* {
    if (event is FetchDataEvent) {
      yield StatesdataLoading();
      try {
//        while fetching the event the data is pass to the LoadedState
        List<Statewise> stateData = await repository.getStateData();
        yield StatesdataLoaded(list: stateData);
      } catch (e) {
        yield StatesdataError(msg: e.toString());
      }
    }
  }
}
