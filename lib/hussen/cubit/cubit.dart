import 'package:bloc/bloc.dart';
import 'package:days/hussen/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class calenderCubit extends Cubit<calenderStates>{

  calenderCubit() : super (calenderInitialState());

  static calenderCubit get(context) => BlocProvider.of(context);

DateTime today = DateTime.now();

void onDaySellected(DateTime day, DateTime focusedDay){
  today = day ;
  emit(calenderSllectDayState());
}



}