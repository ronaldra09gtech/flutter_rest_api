import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rest_api/bloc/product_bloc.dart';
import 'package:flutter_rest_api/bloc/product_event.dart';
import 'package:flutter_rest_api/bloc/product_state.dart';
import 'package:flutter_rest_api/pages/product_details_page.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final ScrollController _scrollController = ScrollController();
  late ProductBloc _productBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _productBloc = BlocProvider.of<ProductBloc>(context);
    _productBloc.add(FetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductError) {
            return Center(child: Text(state.errorMessage));
          }
          if (state is ProductLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                if (index >= state.products.length) {
                  return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  );
                } else {
                  final product = state.products[index];
                  return ListTile(
                    leading: Image.network(product.thumbnail),
                    title: Text(product.title),
                    subtitle: Text('Price: \$${product.price}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(productId: product.id),
                        ),
                      );
                    },
                  );
                }
              },
              itemCount: state.hasReachedMax ? state.products.length : state.products.length + 1,
              controller: _scrollController,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _productBloc.add(FetchProducts());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}