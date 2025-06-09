
// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:quotes_app/app_constant/app_constant.dart';
import 'package:quotes_app/models/get_information.dart';
import 'package:quotes_app/models/random_page_list.dart';
import 'package:http/http.dart' as http;
class InternetServers {
  Future<List<RandomPageList>> getListData (String url) async{
    List<RandomPageList> result = [];
    try {
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data = await jsonDecode(response.body)['query']['random'];
      for (Map<String,dynamic> item in data) {
        result.add(RandomPageList.fromMap(item));
      }
    }      
    } catch (e) { 
      print(e.toString());
    }
  return result;
  } 
  Future<GetInfromation> getInfromation(String title) async{

    try {
    var response = await http.get(Uri.parse(AppConstant.getUrlInfromation(title)));
      if(response.statusCode == 200){
        return GetInfromation.fromMap(jsonDecode(response.body)['parse']);
      }
    } catch (e) {
      print(e.toString());
    }
    return GetInfromation();
  }
}