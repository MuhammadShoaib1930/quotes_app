import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'screen_changer_event.dart';
part 'screen_changer_state.dart';

class ScreenChangerBloc extends Bloc<ScreenChangerEvent, ScreenChangerState> {
  ScreenChangerBloc() : super(ScreenChangerState(0)) {
    on<ChangeScreen>(_changeScreen);
  }

  FutureOr<void> _changeScreen(ChangeScreen event, Emitter<ScreenChangerState> emit) async{
    emit(ScreenChangerState(event.index));
  }
}
