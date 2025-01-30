import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_all/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_all/bloc/counter/counter_event.dart';
import 'package:flutter_bloc_all/bloc/counter/counter_state.dart';
import 'package:flutter_bloc_all/ui/posts/posts_screen.dart';

class CouterScreen extends StatefulWidget {
  const CouterScreen({super.key});

  @override
  State<CouterScreen> createState() => _CouterScreenState();
}

class _CouterScreenState extends State<CouterScreen> {
  late CounterBloc _counterBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counterBloc = CounterBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _counterBloc = CounterBloc();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) =>  _counterBloc,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Counter Example'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PostsScreen()));
                  } ,
                  child: const Text('Next')),
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
                  BlocBuilder<CounterBloc,CounterState>(
                    buildWhen: (current, previos) => false,
                    builder:(context, state){
                      print('build');
                      return   ElevatedButton(onPressed: (){
                        context.read<CounterBloc>().add(IncrementCounter());
                      }, child: Text('Increment'));
                    },
                  ),
                  BlocBuilder<CounterBloc,CounterState>(
                    buildWhen: (current, previos) => false,
                    builder:(context, state){
                      print('build');
                      return   ElevatedButton(onPressed: (){
                        context.read<CounterBloc>().add(DecrementCounter());
                      }, child: Text('Decrement'));
                    },
                  ),


                ],
              )
            ],
          ),
        ),
      );
  }
}
