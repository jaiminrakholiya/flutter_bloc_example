import 'package:flutter/material.dart';
import 'package:flutter_bloc_all/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_all/bloc/todo/to_do_bloc.dart';
import 'package:flutter_bloc_all/repository/favourite_repository.dart';
import 'package:flutter_bloc_all/ui/favourite_app/favoruite_app_screen.dart';
import 'package:flutter_bloc_all/ui/image_picker/image_picker_screen.dart';
import 'package:flutter_bloc_all/ui/posts/posts_screen.dart';
import 'package:flutter_bloc_all/utils/image_picker_utils.dart';
import 'bloc/favourite_app/favourite_app_bloc.dart';
import 'bloc/image_picker/image_picker_bloc.dart';
import 'bloc/posts/posts_bloc.dart';
import 'bloc/switch_example/switch_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/switch_example/switch_example_screen.dart';
import 'ui/todo/to_do_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => ToDoBloc()),
        BlocProvider(create: (_) => FavouriteBloc(FavouriteRepositoty())),
        BlocProvider(create: (_) => PostBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        home: PostsScreen(),
      ),
    );
  }
}
