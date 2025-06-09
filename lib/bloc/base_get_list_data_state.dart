part of 'get_list_data_bloc.dart';

abstract class BaseGetListDataState extends Equatable{}
class LoadingState extends BaseGetListDataState{
  @override
  List<Object?> get props => [];
}
class ErrorState extends BaseGetListDataState{
  final String message = "There is some issues...";
  @override
  List<Object?> get props => [];
}
class GetListDataState extends BaseGetListDataState{

  final List<RandomPageList> data;
  GetListDataState(this.data);
  @override
  List<Object?> get props => [data];
}
