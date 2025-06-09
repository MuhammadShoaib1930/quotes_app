import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/app_constant/app_constant.dart';
import 'package:quotes_app/bloc/app_drawer_bloc.dart';
import 'package:quotes_app/bloc/get_list_data_bloc.dart';

class CostomedDrawer extends StatefulWidget {
  const CostomedDrawer({super.key});

  @override
  State<CostomedDrawer> createState() => _CostomedDrawerState();
}

class _CostomedDrawerState extends State<CostomedDrawer> {
  final TextStyle titleStyle = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.bold,
    color:const Color.fromARGB(255, 173, 159, 250),
  );
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 62, 67, 70),
      elevation: 30,
      semanticLabel: "Settings",
      shadowColor: const Color.fromARGB(255, 1, 57, 160),
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 200,
            child: DrawerHeader(
              child: CircleAvatar(
                backgroundImage: AssetImage(AppConstant.appImagePath),
                maxRadius: 3,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Dark", style: titleStyle),
              BlocBuilder<AppDrawerBloc, AppDrawerState>(
                builder: (context, state) {
                  return Switch(
                    value: (state.themeData == ThemeData.dark()),
                    onChanged: (value) {
                      context.read<AppDrawerBloc>().add(
                        ThemeChnagerEvent(isDark: value),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Dark", style: titleStyle),

              BlocBuilder<AppDrawerBloc, AppDrawerState>(
                builder: (context, state) {
                  return Slider(
                    min: 0,
                    max: 1000,
                    divisions: 1000,
                    label: state.numberOfQueots.round().toString(),
                    value: state.numberOfQueots,
                    onChanged: (newValue) {
                      context.read<AppDrawerBloc>().add(
                        SliderCangerEvent(newValue),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              context.read<GetListDataBloc>().add(ResetEvent());
              context.read<AppDrawerBloc>().add(
                ThemeChnagerEvent(isDark: false),
              );
            },
            child: Text("Reset", style: titleStyle),
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Row(
                        children: [
                          Image.asset(
                            AppConstant.appImagePath,
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 8),
                          Text("Todo v1.0"),
                        ],
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SelectableText(
                            "Developed by ${AppConstant.developerName}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          SelectableText(
                            AppConstant.developerContent,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          SelectableText(
                            AppConstant.developerGmail,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("CANCEL"),
                        ),
                      ],
                    ),
              );
            },
            child: Text("About App", style: titleStyle),
          ),
        ],
      ),
    );
  }
}
