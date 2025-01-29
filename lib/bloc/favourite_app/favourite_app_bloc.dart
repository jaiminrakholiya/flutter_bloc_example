import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_all/bloc/favourite_app/favourite_app_event.dart';
import 'package:flutter_bloc_all/bloc/favourite_app/favourite_app_state.dart';
import 'package:flutter_bloc_all/model/favourite_item_model.dart';
import 'package:flutter_bloc_all/repository/favourite_repository.dart';

class FavouriteBloc extends Bloc<FavouriteEvents, FavouriteItemStates> {
  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> temFavouriteItemList = [];
  FavouriteRepositoty favouriteRepositoty;

  FavouriteBloc(this.favouriteRepositoty) : super(const FavouriteItemStates()) {
    on<FetchFavouriteList>(fetchList);
    on<FavouriteItem>(_addFavouriteItem);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_unSelectItem);
    on<DeleteItem>(_deleteItem);

  }

  void fetchList(
      FetchFavouriteList event, Emitter<FavouriteItemStates> emit) async {
    favouriteList = await favouriteRepositoty.fetchItem();
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        listStatus: ListStatus.success));
  }

  void _addFavouriteItem(
      FavouriteItem event, Emitter<FavouriteItemStates> emit) async {
    final index =
        favouriteList.indexWhere((element) => element.id == element.id);
    favouriteList[index] = event.item;
    emit(state.copyWith(favouriteItemList: List.from(favouriteList)));
  }

  void _selectItem(SelectItem event, Emitter<FavouriteItemStates> emit) async {
    temFavouriteItemList.add(event.item);
    emit(state.copyWith(temFavouriteItemList: List.from(temFavouriteItemList)));
  }

  void _unSelectItem(
      UnSelectItem event, Emitter<FavouriteItemStates> emit) async {
    temFavouriteItemList.remove(event.item);
    emit(state.copyWith(temFavouriteItemList: List.from(temFavouriteItemList)));
  }

  void _deleteItem(
      DeleteItem event, Emitter<FavouriteItemStates> emit) async {
      for(int i=0; i<temFavouriteItemList.length; i++){
        favouriteList.remove(temFavouriteItemList[i]);
      }
      temFavouriteItemList.clear();
    emit(state.copyWith(
      favouriteItemList: List.from(favouriteList),
        temFavouriteItemList: List.from(temFavouriteItemList),
    ));
  }
}
