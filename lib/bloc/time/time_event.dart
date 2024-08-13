import 'package:equatable/equatable.dart';

abstract class TimeEvent extends Equatable {
  const TimeEvent();
}

class TimeUpdated extends TimeEvent {
  final DateTime currentTime;

  const TimeUpdated(this.currentTime);

  @override
  List<Object> get props => [currentTime];
}
