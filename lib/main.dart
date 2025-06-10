import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quotes_app/bloc/app_drawer_bloc.dart';
import 'package:quotes_app/bloc/get_list_data_bloc.dart';
import 'package:quotes_app/bloc/screen_changer_bloc.dart';
import 'package:quotes_app/hive_servers/hive_servers.dart';
import 'package:quotes_app/hive_servers/theme_preference.dart';
import 'package:quotes_app/models/favorate.dart';
import 'package:quotes_app/ui/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try{
    await Hive.initFlutter();
  Hive.registerAdapter(FavorateAdapter());
  await HiveServers().boxInit();
  await ThemePreference().init();
  }catch (e){
    print(e.toString());
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetListDataBloc()),
        BlocProvider(create: (context) => ScreenChangerBloc()),
        BlocProvider(create: (context) => AppDrawerBloc()),
      ],
      child: BlocBuilder<AppDrawerBloc, AppDrawerState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
            theme: state.themeData,
          );
        },
      ),
    );
  }
}
