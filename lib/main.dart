import 'package:bloc_time_app/bloc/time/time_bloc.dart';
import 'package:bloc_time_app/bloc/timer/timer_bloc.dart';
import 'package:bloc_time_app/bloc/timer/timer_event.dart';
import 'package:bloc_time_app/bloc/timer/timer_state.dart';
import 'package:bloc_time_app/time_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TimerBloc(),),
          BlocProvider(create: (context) => TimeBloc(),),
        ],
        child: MaterialApp(
          home: TimerScreen()),
      );
  }
}

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timer App')),
      body: Center(
        child: BlocBuilder<TimerBloc, TimerState>(
          builder: (context, state) {
            final String minutesStr =
                ((state.duration / 60) % 60).floor().toString().padLeft(2, '0');
            final String secondsStr =
                (state.duration % 60).floor().toString().padLeft(2, '0');
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$minutesStr:$secondsStr',
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Actions(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TimeScreen(),
                      ));
                    },
                    child: Text("Time App"))
              ],
            );
          },
        ),
      ),
    );
  }
}

class Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        if (state is TimerInitial) {
          return FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () =>
                context.read<TimerBloc>().add(TimerStarted(state.duration)),
          );
        } else if (state is TimerRunInProgress) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                child: Icon(Icons.pause),
                onPressed: () => context.read<TimerBloc>().add(TimerPaused()),
              ),
              SizedBox(width: 20),
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
              ),
            ],
          );
        } else if (state is TimerRunPause) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                child: Icon(Icons.play_arrow),
                onPressed: () => context.read<TimerBloc>().add(TimerResumed()),
              ),
              SizedBox(width: 20),
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
              ),
            ],
          );
        } else if (state is TimerRunComplete) {
          return FloatingActionButton(
            child: Icon(Icons.replay),
            onPressed: () => context.read<TimerBloc>().add(TimerReset()),
          );
        }
        return Container();
      },
    );
  }
}
