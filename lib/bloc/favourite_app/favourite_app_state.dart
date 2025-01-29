import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_all/model/favourite_item_model.dart';

enum ListStatus { loading, success, failure }

class FavouriteItemStates extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> temFavouriteItemList;
  final ListStatus listStatus;

  const FavouriteItemStates(
      {this.favouriteItemList = const [],
      this.temFavouriteItemList = const [],
      this.listStatus = ListStatus.loading});

  FavouriteItemStates copyWith(
      {List<FavouriteItemModel>? favouriteItemList,
      List<FavouriteItemModel>? temFavouriteItemList,
      ListStatus? listStatus}) {
    return FavouriteItemStates(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      temFavouriteItemList: favouriteItemList ?? this.temFavouriteItemList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [favouriteItemList, temFavouriteItemList, listStatus];
}
