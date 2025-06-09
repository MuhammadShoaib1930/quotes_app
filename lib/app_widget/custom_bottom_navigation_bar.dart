
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/bloc/screen_changer_bloc.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenChangerBloc, ScreenChangerState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.index,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.blueGrey,
          onTap: (value) {
            context.read<ScreenChangerBloc>().add(ChangeScreen(value));
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.book_online),label: "New Quotes"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favorated"),
          ],
        );
      },
    );
  }
}