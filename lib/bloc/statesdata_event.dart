part of 'statesdata_bloc.dart';

abstract class StatesdataEvent extends Equatable {}

// create event
class FetchDataEvent extends StatesdataEvent {
  @override
  List<Object> get props => null;
}
