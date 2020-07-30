part of 'statesdata_bloc.dart';

abstract class StatesdataState extends Equatable {}

class StatesdataInitial extends StatesdataState {
  @override
  List<Object> get props => [];
}

class StatesdataLoading extends StatesdataState {
  @override
  List<Object> get props => [];
}

class StatesdataLoaded extends StatesdataState {
  final List<Statewise> list;

  StatesdataLoaded({this.list});

  @override
  List<Object> get props => [list];
}

class StatesdataError extends StatesdataState {
  final String msg;

  StatesdataError({this.msg});

  @override
  List<Object> get props => [msg];
}
