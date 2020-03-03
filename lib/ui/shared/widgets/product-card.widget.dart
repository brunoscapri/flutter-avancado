import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping/models/product-list-item.model.dart';
import 'package:shopping/ui/android/pages/product.page.dart';
import 'package:shopping/ui/shared/widgets/shared/add-to-cart.widget.dart';

class ProductCard extends StatelessWidget {
  final ProductListItemModel item;

  ProductCard({@required this.item});

  @override
  Widget build(BuildContext context) {
    final price = new NumberFormat("#,##0.00", "pt_BR");

    return Container(
      height: 450,
      width: 240,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.black.withOpacity(0.12),
      ),
      child: Column(
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(
                      tag: item.tag,
                    ),
                  ),
                );
              },
              child: Image.network(item.image)),
          SizedBox(height: 10),
          Text("${item.title}"),
          SizedBox(height: 60),
          Text("${item.brand}"),
          Row(
            children: <Widget>[
              Text("R\$${price.format(item.price)}"),
              AddToCart(item: item),
            ],
          )
        ],
      ),
    );
  }
}
