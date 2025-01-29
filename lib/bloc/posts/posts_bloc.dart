import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_all/bloc/posts/posts_events.dart';
import 'package:flutter_bloc_all/bloc/posts/posts_states.dart';
import 'package:flutter_bloc_all/repository/post_reposiotry.dart';
import 'package:flutter_bloc_all/utils/enums.dart';

class PostBloc extends Bloc<PostsEvent, PostStates> {
  PostRepository postRepository = PostRepository();

  PostBloc() : super(const PostStates()) {
    on<PostFetched>(fetchPostApi);
  }

  void fetchPostApi(PostFetched event, Emitter<PostStates> emit) async{
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
          postStatus: PostStatus.success,
        message: 'Success',
        postList: value
      ));
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(state.copyWith(
          postStatus: PostStatus.failure,
          message: error.toString()));
    });
  }
}
