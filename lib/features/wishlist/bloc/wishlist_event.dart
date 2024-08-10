part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent{

}

class WishlistRemoveItemFromWishlistEvent extends WishlistEvent{
  final ProductDataModel productDataModel;

  WishlistRemoveItemFromWishlistEvent({required this.productDataModel});
}
