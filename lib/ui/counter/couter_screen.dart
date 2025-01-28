import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_all/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_all/bloc/counter/counter_event.dart';
import 'package:flutter_bloc_all/bloc/counter/counter_state.dart';

class CouterScreen extends StatefulWidget {
  const CouterScreen({super.key});

  @override
  State<CouterScreen> createState() => _CouterScreenState();
}

class _CouterScreenState extends State<CouterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc,CounterState>(
            builder:(context, state){
              return   Center(child: Text(state.counter.toString()  ,style: TextStyle(fontSize: 60),),);
            },
          ),

          Row(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(IncrementCounter());
              }, child: Text('Increment')),
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(DecrementCounter());
              }, child: Text('Decrement')),

            ],
          )
        ],
      ),
    );
  }
}
