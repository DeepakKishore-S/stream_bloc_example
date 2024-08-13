import 'package:equatable/equatable.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();
}

class TimerStarted extends TimerEvent {
  final int duration;

  const TimerStarted(this.duration);

  @override
  List<Object> get props => [duration];
}

class TimerTicked extends TimerEvent {
  final int duration;

  const TimerTicked(this.duration);

  @override
  List<Object> get props => [duration];
}

class TimerPaused extends TimerEvent {
  @override
  List<Object> get props => [];
}

class TimerResumed extends TimerEvent {
  @override
  List<Object> get props => [];
}

class TimerReset extends TimerEvent {
  @override
  List<Object> get props => [];
}
