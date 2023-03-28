import 'package:flutter_rest_api/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rest_api/bloc/product_bloc.dart';
import 'package:flutter_rest_api/locator.dart';
import 'package:flutter_rest_api/pages/product_list_page.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => ProductBloc(),
        child: ProductListPage(),
      ),
    );
  }
}