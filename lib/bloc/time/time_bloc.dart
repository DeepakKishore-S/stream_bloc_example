import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_time_app/bloc/timer/timer_bloc.dart';
import 'package:bloc_time_app/bloc/timer/timer_state.dart';
import 'time_event.dart';
import 'time_state.dart';

class TimeBloc extends Bloc<TimeEvent, TimeState> {
  late StreamSubscription streamSubscription;
  TimeBloc() : super(TimeState(DateTime.now())) {
    on<TimeUpdated>(timerUpdate);
    streamSubscription = tick().listen(
      (time) => add(TimeUpdated(time)),
    );
  }

  Stream<DateTime> tick(){
    return Stream.periodic(Duration(seconds: 1), (_) => DateTime.now());
  }

  timerUpdate(TimeUpdated event, Emitter<TimeState> emit) {
    emit(TimeState(event.currentTime));
  }

   @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}


