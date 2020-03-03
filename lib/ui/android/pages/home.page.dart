import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/home.bloc.dart';
import 'package:shopping/ui/shared/widgets/category-list.widget.dart';
import 'package:shopping/ui/shared/widgets/product-list.widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Categorias",
                    style: Theme.of(context).textTheme.headline),
              ),
              SizedBox(
                height: 5,
              ),
              CategoryList(
                categories: bloc.categories,
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Mais Vendidos",
                    style: Theme.of(context).textTheme.headline),
              ),
              ProductList(
                products: bloc.products,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
