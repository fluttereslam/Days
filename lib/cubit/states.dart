
abstract class  NewsState {}



class NewsInitialState extends  NewsState{}

class ChangeNavBarState extends  NewsState{}

class newsGetDataSucessApiState extends  NewsState{}


class newsGetDataErrorApiState extends  NewsState{
  late String error;
  newsGetDataErrorApiState(this.error);
}

class newsLoadingDataFromApiState extends  NewsState{}
