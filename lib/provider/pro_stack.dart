import 'package:flutter/material.dart';
import 'package:movie_app1/modules/movies.dart';


class ProviderVM extends ChangeNotifier{

  final List<Movie>_lst = [];
  List<Movie> get lst => _lst;
  

  void add(String name, String imagePath, String videoPath, String category, int year,  Duration duration){
    _lst.add(Movie(name: name, imagePath: imagePath, videoPath: videoPath, category: category, year: year, duration: duration));
    notifyListeners();
  }

  del(int index){
    lst.removeAt(index);
    notifyListeners();
  }
}