import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart_bloc/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:shopping_cart_bloc/features/wishlist/ui/wishlist_product_tile_widget.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.teal,
        title: const Text("Favourite Items"),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {
          if (state is WishlistItemRemovedFromWishlist){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Item Removed from wishlist"))
            );
          }
        },
        builder: (context, state) {
          switch(state.runtimeType){
            case WishlistSuccessState :
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                    return WishlistProductTileWidget(
                        productDataModel: successState.wishlistItems[index],
                        wishlistBloc: wishlistBloc);
                  });
          }
          return Container();
        },
      ),
    );
  }
}
