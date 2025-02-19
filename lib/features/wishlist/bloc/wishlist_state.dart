part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

sealed class WishlistActionState extends WishlistState{}

final class WishlistInitial extends WishlistState {}

class WishlistSuccessState extends WishlistState{
  final List<ProductDataModel> wishlistItems;

  WishlistSuccessState({required this.wishlistItems});
}

class WishlistItemRemovedFromWishlist extends WishlistActionState{

}