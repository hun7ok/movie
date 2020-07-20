import 'dart:async';

import 'package:movie2/model/movie_model.dart';
import 'package:movie2/service/services.dart';

class MovieBloc extends Services {
  //List listMovie;

  StreamController<List<Movie_model>> _MovieController = StreamController();
  Stream<List<Movie_model>> get tampungdata => _MovieController.stream;

  void ambildata() async {
    try {
      List<Movie_model> listMovie = await Services.getDataMovie();
    } catch (e) {
      _MovieController.sink.add(e);
    }
  }
}

final MvcBlk = MovieBloc();
