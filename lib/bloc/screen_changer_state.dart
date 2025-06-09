part of 'screen_changer_bloc.dart';

class ScreenChangerState extends Equatable {
  final int index;
  const ScreenChangerState(this.index);
  
  @override
  List<Object> get props => [index];
}

