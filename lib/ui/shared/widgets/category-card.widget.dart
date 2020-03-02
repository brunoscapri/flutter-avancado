import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/home.bloc.dart';
import 'package:shopping/models/category-list-item.model.dart';
import 'package:shopping/settings.dart';

class CategoryCard extends StatelessWidget {
  final CategoryListItemModel item;
  CategoryCard({@required this.item});

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);
    return Container(
        width: 70,
        height: 70,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(70)),
          color: item.tag == bloc.selectedCategory
              ? Theme.of(context).primaryColor.withOpacity(0.3)
              : Theme.of(context).primaryColor,
        ),
        child: FlatButton(
          onPressed: () {
            bloc.changeCategory(item.tag);
          },
          child: Image.asset(
              "assets/categories/${Settings.theme}/${item.tag}.png"),
        ));
  }
}
