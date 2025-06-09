import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/app_text_style/app_text_style.dart';
import 'package:quotes_app/bloc/get_list_data_bloc.dart';
import 'package:quotes_app/hive_servers/theme_preference.dart';
import 'package:quotes_app/internet_servers/internet_servers.dart';
import 'package:quotes_app/models/get_information.dart';
import 'package:quotes_app/ui/show_ditiled_screen.dart';
import 'package:quotes_app/utilites/extract_useful_data.dart';

class FatchedOnlineScreen extends StatefulWidget {
  const FatchedOnlineScreen({super.key});

  @override
  State<FatchedOnlineScreen> createState() => _FatchedOnlineScreenState();
}

class _FatchedOnlineScreenState extends State<FatchedOnlineScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: BlocBuilder<GetListDataBloc, BaseGetListDataState>(
        builder: (context, state) {
          if (state is LoadingState) {
            context.read<GetListDataBloc>().add(GetListEvent());
            return Center(child: CircularProgressIndicator());
          } else if (state is GetListDataState) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<GetListDataBloc>().add(RefreshIndicatorEvent());
              },
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      GetInfromation featchedData = await InternetServers()
                          .getInfromation(state.data[index].title.toString());
                      int id = state.data[index].id!;
                      String title = state.data[index].title!;
                      String text = await extractQuotes(featchedData.text!);
                      int pageID = featchedData.pageid!;
                      Navigator.push(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => ShowDitiledScreen(
                                id: id,
                                pageID: pageID,
                                text: text,
                                title: title,
                              ),
                        ),
                      );
                    },
                    child: Card(
                      surfaceTintColor:(ThemePreference().isDark)? Colors.white:Colors.black,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("ID: ", style: AppTextStyle.titleStyle),
                              Text(
                                state.data[index].id.toString(),
                                style: AppTextStyle.contentStyle,
                                softWrap: true,
                              ),
                              IconButton(
                                onPressed: () async {
                                  GetInfromation featchedData =
                                      await InternetServers().getInfromation(
                                        state.data[index].title.toString(),
                                      );
                                  int id = state.data[index].id!;
                                  String title = state.data[index].title!;
                                  String text = await extractQuotes(
                                    featchedData.text!,
                                  );
                                  int pageID = featchedData.pageid!;
                                  // ignore: use_build_context_synchronously
                                  context.read<GetListDataBloc>().add(SaveDataEvent(title, text, id, pageID));
                                   // ignore: use_build_context_synchronously
                                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Favorated")));
                                },
                                icon: Icon(Icons.favorite),
                              ),
                            ],
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Title: ", style: AppTextStyle.titleStyle),
                              Expanded(
                                child: Text(
                                  state.data[index].title.toString(),
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
                itemCount: state.data.length,
              ),
            );
          } else if (state is ErrorState) {
            return Center(child: Text(state.message));
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
