import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorChange extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void changeColor(int value) {
    state = value;
  }
}

final colorChangeProvider = NotifierProvider<ColorChange, int>(() {
  return ColorChange();
});
