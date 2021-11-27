import 'dart:async';

class CountBloc {
  final _statecountcont = StreamController<int>();
  StreamSink<int> get statecountsink => _statecountcont.sink;
  Stream<int> get statecountstream => _statecountcont.stream;

  addbut(int count, Function func) {
    func();
    statecountsink.add(count);
  }

  void dispose() {
    _statecountcont.close();
  }
}
