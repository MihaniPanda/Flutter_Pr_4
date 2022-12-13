import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit_counter.dart';
import '../cubit/cubit_list.dart';
import '../cubit/cubit_settings.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Пееключатель'),
        actions: [
          ElevatedButton(
          child: Text('Сменить тему'),
          onPressed: (){
            context.read<SettingCubit>().toogleTheme();
              if(context.read<SettingCubit>().state.theme == ThemeData.light())
                 context.read<ListCubit>().addHistory("Светлая тема");
              else
                context.read<ListCubit>().addHistory('Тёмная тема');
          },
      ),
        ],
      ),
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          <Widget>[
          BlocBuilder<CounterCubit,CounterState>(
          builder: (context, state) {

            return Center(child:
              Text('${state.count}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35
               ),
              )
            );

          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ElevatedButton(

                onPressed: ()
                {
                  if(context.read<SettingCubit>().state.theme == ThemeData.light())
                  {
                    context.read<CounterCubit>().increment();
                    context.read<ListCubit>().addHistory("увелечение счетчика на 1");
                  }
                  else
                  {
                    context.read<CounterCubit>().increment(2);
                    context.read<ListCubit>().addHistory("увелечение счетчика на 2");
                  }
                }, 
                child: Text(
                  '+',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),
                  ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
                ),
              ),


             ),
             Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ElevatedButton(
                onPressed: ()
                {
                  if(context.read<SettingCubit>().state.theme == ThemeData.light())
                  {
                    context.read<CounterCubit>().decrement();
                    context.read<ListCubit>().addHistory("уменьшение счетчика на 1");
                  }
                  else
                  {
                    context.read<CounterCubit>().decrement(2); 
                    context.read<ListCubit>().addHistory("уменьшение счетчика на 2");
                  }
                }, 
                child: Text(
                  '-',
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                    ),
                  ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
                  
                ),
              )

             )
            ]
          ),

          Expanded(
          child: SizedBox(
            height: 500.0,
            child: 
            BlocBuilder<ListCubit, ListState>(
              builder: (context, state)
              {
                return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: context.read<ListCubit>().state.history.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(index.toString()),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${context.read<ListCubit>().state.history[index]}'),
                    ),

                  ]
                  );
              }
              );
              }
            )
          ),
        ),
      ]
      ),
      ),
      

    );
  }
}