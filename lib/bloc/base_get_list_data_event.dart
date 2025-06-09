// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_list_data_bloc.dart';

abstract class BaseGetListDataEvent extends Equatable{}
class GetListEvent extends BaseGetListDataEvent{
  @override
  List<Object?> get props => [];
}
class RefreshIndicatorEvent extends BaseGetListDataEvent{
  @override
  List<Object?> get props => [];
}
class SaveDataEvent extends BaseGetListDataEvent{
  final String title;
  final String text;
  final int id;
  final int pageID;
  SaveDataEvent(this.title,this.text,this.id,this.pageID);
  @override
  List<Object?> get props => [title,text,id,pageID];

}

class DeleteDataEvent extends BaseGetListDataEvent{
  final int keyData;
  DeleteDataEvent(this.keyData);
  @override
  List<Object?> get props => [keyData];

}
class ResetEvent extends BaseGetListDataEvent{
  @override
  List<Object?> get props => [];

}
