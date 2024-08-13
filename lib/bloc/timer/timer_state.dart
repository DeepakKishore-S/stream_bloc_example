import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  final int duration;

  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

class TimerInitial extends TimerState {
  const TimerInitial(int duration) : super(duration);
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(int duration) : super(duration);
}

class TimerRunPause extends TimerState {
  const TimerRunPause(int duration) : super(duration);
}

class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}
