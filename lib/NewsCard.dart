import 'package:days/cubit/cubit.dart';
import 'package:days/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/components.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
          providers: [
          BlocProvider(
          create: (BuildContext context)=> NewsCubit()..getBussiness(),)],
      child: BlocConsumer<NewsCubit,NewsState>(
          builder: (context,state){
            return articleBuilder(NewsCubit.get(context).bussiness, context);
          },
          listener: (context,state){})),
    );
    //   Container(
    //   margin: EdgeInsets.all(20),
    //   child: Container(
    //     decoration: BoxDecoration(
    //         // border: Border.all(width: 1),
    //         borderRadius: BorderRadius.circular(15),
    //         boxShadow: [
    //           BoxShadow(
    //             color: Color.fromARGB(255, 169, 166, 179),
    //             offset: Offset(2, 8),
    //             blurRadius: 10,
    //           ),
    //           BoxShadow(color: Color.fromARGB(255, 255, 255, 255))
    //         ]),
    //     width: double.infinity,
    //     height: 310,
    //     child: Column(children: [
    //       Container(
    //         height: 100,
    //         width: double.infinity,
    //         child: FittedBox(
    //           fit: BoxFit.fill,
    //           child: ClipRRect(
    //             borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(15),
    //                 topRight: Radius.circular(15)),
    //             child: Image.network(
    //                 "https://upload.wikimedia.org/wikipedia/commons/e/e7/Haystack_News_Logo.jpg"),
    //           ),
    //         ),
    //       ),
    //       Expanded(
    //         child: Container(
    //           width: double.infinity,
    //           // height: 190,
    //           margin: EdgeInsets.all(10),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Text(
    //                     "This is the first news",
    //                     style: TextStyle(
    //                         fontSize: 20, fontWeight: FontWeight.bold),
    //                   ),
    //                   Text(
    //                     "10-1-2023",
    //                     style: TextStyle(fontSize: 16, color: Colors.grey),
    //                   )
    //                 ],
    //               ),
    //               Text("Category",
    //                   style: TextStyle(
    //                       fontSize: 16,
    //                       color: Colors.grey,
    //                       fontWeight: FontWeight.bold)),
    //               Text("Country",
    //                   style: TextStyle(fontSize: 16, color: Colors.grey)),
    //               SizedBox(
    //                 height: 25,
    //               ),
    //               Container(
    //                 // height: 200,
    //                 child: Expanded(
    //                   child: Text(
    //                     "kjkwnjdknewjkwkjdwqdjkqwndljqwendjlqwnldqjwkjkwnjdknewjkwkjdwqdjkqwndljqwendjlqwnldqjwkjkwnjdknewjkwkjdwqdjkqwndljqwendjlqwnldqjwkjkwnjdknewjkwkjdwqdjkqwndljqwendjlqwnldqjwkjkwnjdknewjkwkjdwqdjkqwndljqwendjlqwnldqjwkjkwnjdknewjkwkjdwqdjkqwndljqwendjlqwnldqjwkjkwnjdknewjkwkjdwqdjkqwndljqwendjlqwnldqjw",
    //                     overflow: TextOverflow.fade,
    //                     // maxLines: 5,
    //                   ),
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //       )
    //     ]),
    //   ),
    // );
  }
}
