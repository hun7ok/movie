import 'dart:async';

import 'package:movie2/service/services.dart';

class MovieBloc extends Services {
  List dataparsing;

  StreamController<int> _MovieController = StreamController();
  Stream<int> get tampungdata => _MovieController.stream;

  void ambildata() {
    _MovieController.sink.add(getDataMovie());
  }
}
