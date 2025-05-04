
import 'package:flutter/material.dart';
import 'package:uoajk_day5/models/product.dart';

class ProductDetailScreen extends StatelessWidget {

  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(product.title!),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              Image.network(product.images![0]),

              Text(product.description!),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Category'),
                          CircleAvatar(
                            radius: 40,
                            child: Text(product.category!),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text('Price'),
                      CircleAvatar(
                        radius: 40,
                        child: Text(product.price!.toString()),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 40,
                    child: Text(product.stock!.toString()),
                  ),


                  product.brand !=null ?
                  CircleAvatar(
                    radius: 40,
                    child: Text(product.brand ?? 'NA'),
                  ) : SizedBox.shrink(),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(

                    children: [
                      Icon(Icons.star, color: Colors.amber,),
                      Text(product.rating!.toString()),
                      SizedBox(width: 20,),
                      Text('1.3K Sold'),

                    ],
                  ),

                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.favorite_border),
                      Icon(Icons.share),

                    ],
                  )
                ],
              )


            ],
          ),
        ),
      ),

    );

  }
}
