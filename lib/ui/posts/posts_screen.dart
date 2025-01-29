import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20%20';
import 'package:flutter_bloc_all/bloc/posts/posts_bloc.dart';
import 'package:flutter_bloc_all/bloc/posts/posts_events.dart';
import 'package:flutter_bloc_all/utils/enums.dart';

import '../../bloc/posts/posts_states.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts APIs'),
      ),
      body: BlocBuilder<PostBloc,PostStates>(
          builder: (context,state){
            switch(state.postStatus){
              case PostStatus.loading:
                return CircularProgressIndicator();
              case PostStatus.failure:
                return Center(child: Text(state.message.toString()));
              case PostStatus.success:
                return ListView.builder(
                    itemCount: state.postList.length,
                    itemBuilder: (context,index){
                      final item = state.postList[index];
                      return ListTile(
                        title: Text(item.email.toString()),
                        subtitle: Text(item.body.toString()),
                      );
                    });

            }

          },),
    );
  }
}
