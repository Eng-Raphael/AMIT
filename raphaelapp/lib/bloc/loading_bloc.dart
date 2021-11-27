import 'dart:async';

class LoadingBloc {
  final _loadingcontroller = StreamController<bool>();
  StreamSink<bool> get loadingsink => _loadingcontroller.sink;
  Stream<bool> get loadingstream => _loadingcontroller.stream;

  void dispose() {
    _loadingcontroller.close();
  }
}
