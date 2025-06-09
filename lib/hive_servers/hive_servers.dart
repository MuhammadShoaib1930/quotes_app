
import 'package:hive/hive.dart';
import 'package:quotes_app/app_constant/app_constant.dart';
import 'package:quotes_app/models/favorate.dart';

class HiveServers{
  static final HiveServers _instance = HiveServers._internal();
  HiveServers._internal();
  factory HiveServers()=>_instance;
  static Box<Favorate>? _box;
  Future<Box<Favorate>> getBox()async{
    if (_box != null && _box!.isOpen) {
      return _box!;
    }
    await boxInit();
    return _box!;
  }
  Future<bool> boxInit()async{
    if (_box != null && _box!.isOpen) {
      return true;
    }
    _box = await Hive.openBox<Favorate>(AppConstant.boxName);
    return true;
  }
  Future<void> savedData(String title,String text , int id, int pageID )async{
    if(await boxInit()){

      _box!.put(id,Favorate(title: title, text: text, pageID: pageID, id: id));
    }
  }
  Future<void> delete(int keyData)async{
    await _box!.delete(keyData);
  }
  Future<void> clearData()async{
    await _box!.clear();
  }
}