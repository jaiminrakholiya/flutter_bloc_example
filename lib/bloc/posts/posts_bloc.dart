import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_all/bloc/posts/posts_events.dart';
import 'package:flutter_bloc_all/bloc/posts/posts_states.dart';
import 'package:flutter_bloc_all/repository/post_reposiotry.dart';
import 'package:flutter_bloc_all/utils/enums.dart';

import '../../model/posts_model.dart';

class PostBloc extends Bloc<PostsEvent, PostStates> {

  List<PostModel> temPostList =[];
  PostRepository postRepository = PostRepository();

  PostBloc() : super(const PostStates()) {
    on<PostFetched>(fetchPostApi);
    on<SearchItem>(_filterList);
  }

  void _filterList(SearchItem event, Emitter<PostStates> emit) async{
    if(event.stSearch.isEmpty) {
      emit(state.copyWith(temPostList: [],searchMessage: ''));
    }else{
      temPostList = state.postList.where((element) => element.id.toString() == event.stSearch.toString()).toList();
      if(temPostList.isEmpty){
        emit(state.copyWith(temPostList: temPostList,searchMessage: 'No data found'));
      }else{
        emit(state.copyWith(temPostList: temPostList));

      }
    }
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
