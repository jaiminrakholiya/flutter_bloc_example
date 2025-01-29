import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20%20';
import 'package:flutter_bloc_all/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:flutter_bloc_all/bloc/favourite_app/favourite_app_event.dart';
import 'package:flutter_bloc_all/bloc/favourite_app/favourite_app_state.dart';
import 'package:flutter_bloc_all/model/favourite_item_model.dart';

class FavoruiteAppScreen extends StatefulWidget {
  const FavoruiteAppScreen({super.key});

  @override
  State<FavoruiteAppScreen> createState() => _FavoruiteAppScreenState();
}

class _FavoruiteAppScreenState extends State<FavoruiteAppScreen> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavouriteList());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<FavouriteBloc, FavouriteItemStates>(
            builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return Center(child: const CircularProgressIndicator());
            case ListStatus.failure:
              return const Text('something went wrong');
            case ListStatus.success:
              return ListView.builder(
                  itemCount: state.favouriteItemList.length,
                  itemBuilder: (context, index) {
                    final item = state.favouriteItemList[index];
                    return Card(
                        child: ListTile(
                      leading: Checkbox(
                        value: state.temFavouriteItemList.contains(item)?  true:false,
                        onChanged: (value) {
                          if (value!) {
                            context
                                .read<FavouriteBloc>()
                                .add(SelectItem(item: item));
                          } else {
                            context
                                .read<FavouriteBloc>()
                                .add(UnSelectItem(item: item));
                          }
                        },
                      ),
                      title: Text(item.value.toString()),
                      trailing: IconButton(
                        onPressed: () {
                          FavouriteItemModel itemModel = FavouriteItemModel(
                              id: item.id,
                              value: item.value,
                              isFavourite: item.isFavourite ? false : true);
                          context
                              .read<FavouriteBloc>()
                              .add(FavouriteItem(item: itemModel));
                        },
                        icon: Icon(item.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined),
                      ),
                    ));
                  });
          }
        }),
      ),
    );
  }
}
