part of 'app_drawer_bloc.dart';

class AppDrawerState extends Equatable {
  final ThemeData themeData;
  final double numberOfQueots;
  const AppDrawerState({
    required this.themeData,
    required this.numberOfQueots
  });
  @override
  List<Object> get props => [
    themeData,
    numberOfQueots
  ];
 
}