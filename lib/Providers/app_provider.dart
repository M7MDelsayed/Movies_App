import 'package:flutter/material.dart';

import '../Model/movie_popular/Result.dart';

class AppProvider extends ChangeNotifier {
  List<Result> watchList = [];
  List<int> idList = [];

  void selectMovie(Result resultMovie) {
    if (!idList.contains(resultMovie.id)) {
      watchList.add(resultMovie);
      idList.add(resultMovie.id!);
    } else if (idList.contains(resultMovie.id)) {
      watchList.remove(resultMovie);
      idList.remove(resultMovie.id);
    }
    notifyListeners();
  }
}
