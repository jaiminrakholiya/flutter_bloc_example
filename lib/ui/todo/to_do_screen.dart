import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20%20';
import 'package:flutter_bloc_all/bloc/todo/to_do_bloc.dart';
import 'package:flutter_bloc_all/bloc/todo/to_do_state.dart';

import '../../bloc/todo/to_do_event.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if (state.todoList.isEmpty) {
            return const Center(
              child: Text('No todo found'),
            );
          } else if (state.todoList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todoList[index]),
                  trailing: IconButton(
                    onPressed: () {
                      context
                          .read<ToDoBloc>()
                          .add(RemoveTodoEvent(task: state.todoList[index]));
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 20; i++) {
            context
                .read<ToDoBloc>()
                .add(AddTodoEvent(task: 'Task: ' + i.toString()));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
