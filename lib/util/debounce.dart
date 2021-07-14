import 'dart:async';

/// http://reactivex.io/documentation/operators/debounce.html
///
/// ```dart
/// final _debounce = Debounce()
/// _debounce(() { /* Your function here */ });
/// ```
class Debounce {
  final Duration delay;
  Timer? _timer;

  Debounce({
    this.delay = const Duration(milliseconds: 300),
  });

  void call(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }
}
