import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_changer_state.dart';
part 'color_changer_cubit.freezed.dart';

class ColorChangerCubit extends Cubit<ColorChangerState> {
  ColorChangerCubit() : super(const ColorChangerState.initial());

  Future<void> changeColors() async {
    emit(const ColorChangerState.color1(Colors.grey));
    // await Future.delayed(const Duration(milliseconds: 100));
    emit(const ColorChangerState.color2(Colors.grey));
    // await Future.delayed(const Duration(milliseconds: 100));
    emit(const ColorChangerState.color3(Colors.grey));
  }
}
