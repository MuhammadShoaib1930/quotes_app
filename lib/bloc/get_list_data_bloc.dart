import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/app_constant/app_constant.dart';
import 'package:quotes_app/hive_servers/hive_servers.dart';
import 'package:quotes_app/internet_servers/internet_servers.dart';
import 'package:quotes_app/models/random_page_list.dart';

part 'base_get_list_data_event.dart';
part 'base_get_list_data_state.dart';

class GetListDataBloc extends Bloc<BaseGetListDataEvent, BaseGetListDataState> {
  GetListDataBloc() : super(LoadingState()) {
    on<GetListEvent>(_getListEvent);
    on<RefreshIndicatorEvent>(_refreshIndicatorEvent);
    on<SaveDataEvent>(_saveDataEvent);
    on<DeleteDataEvent>(_deleteDataEvent);
    on<ResetEvent>(_resetEvent);
  }

  FutureOr<void> _getListEvent(
    GetListEvent event,
    Emitter<BaseGetListDataState> emit,
  ) async {
    emit(LoadingState());
    List<RandomPageList> data = await InternetServers().getListData(AppConstant.getURL);
    emit(GetListDataState(data));
  }

  FutureOr<void> _refreshIndicatorEvent(
    RefreshIndicatorEvent event,
    Emitter<BaseGetListDataState> emit,
  ) async {
    emit(LoadingState());
    add(GetListEvent());
  }

  FutureOr<void> _saveDataEvent(SaveDataEvent event, Emitter<BaseGetListDataState> emit) async{
    await HiveServers().savedData(event.title, event.text, event.id, event.pageID);
  }

  FutureOr<void> _deleteDataEvent(DeleteDataEvent event, Emitter<BaseGetListDataState> emit) async{
    await HiveServers().delete(event.keyData);
  }

  FutureOr<void> _resetEvent(ResetEvent event, Emitter<BaseGetListDataState> emit) async{
    await HiveServers().clearData();
  }


}
