import 'dart:async';
import 'dart:ui';

class Debounce {
  factory Debounce() => _instance;

  Debounce._();

  static final Debounce _instance = Debounce._();

  static Timer? _timer;

  static void run(
    VoidCallback action, {
    Duration delay = const Duration(milliseconds: 500),
  }) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }
}
