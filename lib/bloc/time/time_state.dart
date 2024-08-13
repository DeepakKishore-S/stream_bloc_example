import 'package:equatable/equatable.dart';

class TimeState extends Equatable {
  final DateTime currentTime;

  const TimeState(this.currentTime);

  @override
  List<Object> get props => [currentTime];
}
