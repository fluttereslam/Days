import 'package:days/hussen/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import 'cubit/states.dart';

class Appointment extends StatelessWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


var cubit = calenderCubit.get(context);
    return BlocConsumer<calenderCubit,calenderStates>(
        listener: (context,state){},
        builder: (context,state)=>
         Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: AppBar(
              elevation: 0,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                      color: Colors.blueAccent,
                    ),

                      child: TableCalendar(
                          focusedDay: cubit.today,
                          rowHeight: 38,
                          firstDay: DateTime.utc(2010, 1, 1),
                          lastDay: DateTime.utc(2040, 1, 1),
                          headerStyle: HeaderStyle(
                            titleTextStyle: TextStyle(color: Colors.white),
                            leftChevronIcon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                            rightChevronIcon: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),
                            formatButtonVisible: false,
                            titleCentered: true,


                          ),
                          daysOfWeekStyle:DaysOfWeekStyle(
                              weekdayStyle: TextStyle(color: Colors.white),
                            weekendStyle: TextStyle(color: Colors.white),
                          ),
                        calendarStyle: CalendarStyle(
                          defaultTextStyle: TextStyle(color: Colors.white),
                          weekendTextStyle: TextStyle(color: Colors.white),
                           todayDecoration:BoxDecoration(
                       color: Colors.grey[300],
                       shape: BoxShape.circle,
                     ),
                          selectedDecoration:BoxDecoration(
                       color: Colors.orangeAccent,
                       shape: BoxShape.circle,
                     ),
                        ),
                        availableGestures: AvailableGestures.all,
                        onDaySelected:(day, focusedDay)
                        {
                            cubit.onDaySellected(day, focusedDay);
                        },
                        selectedDayPredicate: (day)=>isSameDay(day, cubit.today),

                      ),
                  ),
                ),

              ],
            ),
          ),
        ),
      );
  }
}
