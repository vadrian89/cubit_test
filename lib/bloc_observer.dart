// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) print(change);
    super.onChange(bloc, change);
  }
}
