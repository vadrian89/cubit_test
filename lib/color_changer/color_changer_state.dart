part of 'color_changer_cubit.dart';

@freezed
class ColorChangerState with _$ColorChangerState {
  const factory ColorChangerState.initial() = _Initial;
  const factory ColorChangerState.color1(Color color) = _Color1;
  const factory ColorChangerState.color2(Color color) = _Color2;
  const factory ColorChangerState.color3(Color color) = _Color3;
}
