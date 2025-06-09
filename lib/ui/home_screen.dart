import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/app_widget/costomed_drawer.dart';
import 'package:quotes_app/app_widget/custom_bottom_navigation_bar.dart';
import 'package:quotes_app/bloc/screen_changer_bloc.dart';
import 'package:quotes_app/ui/fatched_online_screen.dart';
import 'package:quotes_app/ui/favorate_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> screen = [FatchedOnlineScreen(), FavorateScreen()];
    final List<String> title = ["Queotes", "Favorated"];
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<ScreenChangerBloc, ScreenChangerState>(
          builder: (context, state) {
            return Text(title[state.index]);
          },
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ScreenChangerBloc, ScreenChangerState>(
        builder: (context, state) {
          return screen[state.index];
        },
      ),
      bottomNavigationBar:CustomBottomNavigationBar() ,
      drawer: CostomedDrawer(),
    );
  }
}
