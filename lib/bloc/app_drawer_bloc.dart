

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/hive_servers/theme_preference.dart';

part 'app_drawer_event.dart';
part 'app_drawer_state.dart';

class AppDrawerBloc extends Bloc<BaseAppDrawerEvent, AppDrawerState> {
  AppDrawerBloc()
    : super(
        AppDrawerState(
          themeData:
              (ThemePreference().isDark) ? ThemeData.dark() : ThemeData.light(),
        ),
      ) {
    on<ThemeChnagerEvent>(_themeChanger);
  }
  void _themeChanger(ThemeChnagerEvent event, Emitter<AppDrawerState> emit) {
    if (event.isDark) {
      ThemePreference().setDark(event.isDark);
      emit(
        AppDrawerState(
          themeData: ThemeData.dark(),        ),
      );
    } else {
      ThemePreference().setDark(event.isDark);
      emit(
        AppDrawerState(
          themeData: ThemeData.light(),
        ),
      );
    }
  }

 
}
