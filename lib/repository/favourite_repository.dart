import 'package:flutter_bloc_all/model/favourite_item_model.dart';

class FavouriteRepositoty {
  Future<List<FavouriteItemModel>> fetchItem() async {
    await Future.delayed(Duration(seconds: 3));
    return List.of(_generateList(10));
  }

  List<FavouriteItemModel> _generateList(int length) {
    return List.generate(
        length,
        (index) =>
            FavouriteItemModel(id: index.toString(), value: 'Item $index'));
  }
}
