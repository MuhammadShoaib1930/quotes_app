part of 'screen_changer_bloc.dart';

sealed class ScreenChangerEvent extends Equatable {
  const ScreenChangerEvent();

  @override
  List<Object> get props => [];
}
class ChangeScreen extends ScreenChangerEvent{
  final int index;
  const ChangeScreen(this.index);
  @override
  List<Object> get props => [index];

}