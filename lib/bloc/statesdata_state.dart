part of 'statesdata_bloc.dart';

abstract class StatesdataState extends Equatable {}
//define the states where has while running

//initial state where nothing happen
class StatesdataInitial extends StatesdataState {
  @override
  List<Object> get props => [];
}

// loading state to show while the is data is fetching
class StatesdataLoading extends StatesdataState {
  @override
  List<Object> get props => [];
}

// after the data is fetch than store the data in Statewise List and pass it to the constructor
class StatesdataLoaded extends StatesdataState {
  final List<Statewise> list;

  StatesdataLoaded({this.list});

  @override
  List<Object> get props => [list];
}

// checking for the error while loading the data
class StatesdataError extends StatesdataState {
  final String msg;

  StatesdataError({this.msg});

  @override
  List<Object> get props => [msg];
}
