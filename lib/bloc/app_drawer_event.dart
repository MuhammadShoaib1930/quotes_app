part of 'app_drawer_bloc.dart';

abstract class BaseAppDrawerEvent extends Equatable {
  const BaseAppDrawerEvent();

  @override
  List<Object> get props => [];
}
class ThemeChnagerEvent extends BaseAppDrawerEvent{
  final bool isDark;
  const ThemeChnagerEvent({required this.isDark});
  @override
  List<Object> get props => [isDark];
}
class SliderCangerEvent extends BaseAppDrawerEvent{
  final double numberOfQueots;
  const SliderCangerEvent(this.numberOfQueots);
  @override
  List<Object> get props => [numberOfQueots];
}