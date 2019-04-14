import 'package:flutter/material.dart';
// import 'pages/Product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteproduct;

  Products(this.products, {this.deleteproduct}) {
    print('[products widget] constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("Details"),
                onPressed: () => Navigator.pushNamed<bool>(
                            context, '/products/' + index.toString())
                        .then((bool value) {
                      if (value) {
                        deleteproduct(index);
                      }
                    }),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productcards;
    if (products.length > 0) {
      productcards = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      productcards = Container();
    }
    return productcards;
  }

  @override
  Widget build(BuildContext context) {
    print('[products widget] build');
    return _buildProductList();
  }
}