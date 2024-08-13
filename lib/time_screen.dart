import 'package:bloc_time_app/bloc/time/time_bloc.dart';
import 'package:bloc_time_app/bloc/time/time_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Current Time')),
      body: Center(
        child: BlocBuilder<TimeBloc, TimeState>(
          builder: (context, state) {
            final String timeString = state.currentTime.toLocal().toString().split(' ')[1].split('.')[0];
            return Text(
              timeString,
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
    );
  }
}