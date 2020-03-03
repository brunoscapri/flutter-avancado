import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/home.bloc.dart';
import 'package:shopping/ui/android/pages/home.page.dart';
import 'package:shopping/ui/shared/widgets/category-list.widget.dart';
import 'package:shopping/ui/shared/widgets/product-list.widget.dart';

void main() => runApp(MyApp());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(value: HomeBloc()),
      ],
      child: Main(),
    );
  }
}
