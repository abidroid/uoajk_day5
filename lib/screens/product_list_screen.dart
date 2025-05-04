import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uoajk_day5/models/product.dart';
import 'package:http/http.dart' as http;

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  Future<List<Product>> getAllProducts() async {
    List<Product> products = [];

    String url = 'https://dummyjson.com/products';
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonProductList = jsonResponse['products'];

      for (var jsonProduct in jsonProductList) {
        Product product = Product.fromJson(jsonProduct);
        products.add(product);
      }
    } else {}

    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products Screen"),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),

      body: FutureBuilder<List<Product>>(
        future: getAllProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          if( snapshot.hasData){

            List<Product> products = snapshot.data;

            return GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 240,

                ),
                itemBuilder: (BuildContext context, int index){

                  Product product = products[index];

                  return Card(
                    color: Colors.pink[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(product.thumbnail!),
                          ),

                          Text(product.title!),
                          Text('Price: \$${product.price!.toString()}'),

                        ],
                      ),
                    ),
                  );
                });
          }else{
            return Center(child: SpinKitSpinningLines(color: Colors.purple),);
          }
        },
      ),
    );
  }
}
