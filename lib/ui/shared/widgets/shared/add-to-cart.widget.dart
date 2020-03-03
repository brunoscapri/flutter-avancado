import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/cart.bloc.dart';
import 'package:shopping/models/cart-item.model.dart';
import 'package:shopping/models/product-list-item.model.dart';

class AddToCart extends StatelessWidget {
  final ProductListItemModel item;
  AddToCart({@required this.item});

  @override
  Widget build(BuildContext context) {
    CartBloc bloc = Provider.of<CartBloc>(context);
    CartItemModel cartItem = new CartItemModel(
      id: item.id,
      title: item.title,
      quantity: 1,
      price: item.price,
      image: item.image,
    );
    if (!bloc.itemInCart(cartItem)) {
      return Container(
        height: 40,
        width: 80,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: FlatButton(
            onPressed: () {
              bloc.add(cartItem);
              final snackbar = SnackBar(
                content: Text("${cartItem.title} added to cart"),
                backgroundColor: Theme.of(context).primaryColor,
              );
              Scaffold.of(context).showSnackBar(snackbar);
            },
            child: Icon(Icons.add_shopping_cart)),
      );
    } else {
      return Container(
        height: 40,
        width: 80,
        decoration: BoxDecoration(color: Colors.red),
        child: FlatButton(
          onPressed: () {
            bloc.remove(cartItem);
            final snackbar = SnackBar(
              content: Text("${cartItem.title} removed from cart"),
              backgroundColor: Colors.red,
            );
            Scaffold.of(context).showSnackBar(snackbar);
          },
          child: Icon(Icons.remove_shopping_cart),
        ),
      );
    }
  }
}
