import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:shopping_cart_bloc/features/cart/ui/card_product_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.teal,
        title: const Text(
          "Cart Items",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is CartItemRemovedActionState){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Product Removed From Cart"))
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context, index) {
                    return CardProductTileWidget(
                      cartBloc: cartBloc,
                      productDataModel: successState.cartItems[index],
                    );
                  });
            default :
              return const SizedBox();
          }
          return Container();
        },
      ),
    );
  }
}
