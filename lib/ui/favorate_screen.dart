import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quotes_app/app_constant/app_constant.dart';
import 'package:quotes_app/app_text_style/app_text_style.dart';
import 'package:quotes_app/bloc/get_list_data_bloc.dart';
import 'package:quotes_app/hive_servers/theme_preference.dart';
import 'package:quotes_app/models/favorate.dart';
import 'package:quotes_app/ui/show_ditiled_screen.dart';

class FavorateScreen extends StatefulWidget {
  const FavorateScreen({super.key});

  @override
  State<FavorateScreen> createState() => _FavorateScreenState();
}

class _FavorateScreenState extends State<FavorateScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ValueListenableBuilder(
        valueListenable: Hive.box<Favorate>(AppConstant.boxName).listenable(),
        builder: (context, box, _) {
          List<Favorate> data = box.values.toList();
          if(data.isEmpty){
            return Center(child: Text("There is no favorate data."),);
          }else{

          return ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShowDitiledScreen(id: data[index].id, pageID: data[index].pageID, title: data[index].title, text: data[index].text),));
                },
                child: Card(
                  surfaceTintColor:(ThemePreference().isDark)? Colors.white:Colors.black,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("ID: ", style: AppTextStyle.titleStyle),
                          Text(
                            data[index].id.toString(),
                            style: AppTextStyle.contentStyle,
                            softWrap: true,
                          ),
                          IconButton(onPressed: (){
                            context.read<GetListDataBloc>().add(DeleteDataEvent(data[index].id));
                          }, icon: Icon(Icons.delete))
                        ],
                      ),
                
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Title: ", style: AppTextStyle.titleStyle),
                          Expanded(
                            child: Text(
                              data[index].title.toString(),
                              style: AppTextStyle.contentStyle,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: data.length,
          );
          }
        },
      ),
    );
  }
}
