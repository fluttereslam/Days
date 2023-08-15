
import 'package:days/AllNewsRepo.dart';
import 'package:days/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../all_news_model.dart';


class NewsCubit extends Cubit< NewsState> {

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<dynamic> bussiness = [];

//  1/news?apikey=pub_163057ae0fa186a1ef7d062d07c8cc0f49944&q=news&country=eg&language=ar&category=business
  void getBussiness() {
    emit(newsLoadingDataFromApiState());
    if(bussiness.length == 0){ DioHelper.getData(
        url: '1/news?',
        Quiry: {
          'apikey': 'pub_163057ae0fa186a1ef7d062d07c8cc0f49944',
          'q': 'news',
          'country': 'eg',
          'language': 'ar',
          'category': 'sports',

        }).then((value) {
      emit(newsGetDataSucessApiState());
      bussiness = value.data['results'];
      print("BUSINESS HERE${bussiness[1]['title']}");
    }).catchError((error) {
      emit(newsGetDataErrorApiState(error.toString()));
      print(error.toString());
    });
    }else{
      emit(newsGetDataSucessApiState());
    }

  }

  }











