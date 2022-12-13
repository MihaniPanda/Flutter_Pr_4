import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercubit/screens/main_page.dart';

import 'cubit/cubit_counter.dart';
import 'cubit/cubit_list.dart';
import 'cubit/cubit_settings.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => SettingCubit()),
        BlocProvider(create: (context) => ListCubit())
      ],

      child: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.theme,
            home: const HomePage(),
          );
        }
      ),
    );
  }
}

