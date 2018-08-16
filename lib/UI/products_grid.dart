import 'package:flutter/material.dart';
import 'package:innovation_day_pos/UI/product_item.dart';

class ProductsGrid extends StatefulWidget{

  static ProductItem merch1 = new ProductItem('New York cap', 'images/david.jpg');

  static List<ProductItem> merchList = List.from([merch1]);

  List<ProductItem> currentProducts = List.from(merchList);

  @override
  State<StatefulWidget> createState() {
    return ProductsGridState();
  }
}

class ProductsGridState extends State<ProductsGrid>{

  void productAdd(ProductItem item){
    //add
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this would produce 2 rows.
      crossAxisCount: 4,
      // Generate 100 Widgets that display their index in the List
      children: List.generate(widget.currentProducts.length, (index) {
        widget.currentProducts[index].onTap = productAdd;
        return widget.currentProducts[index];
      }),
    );
  }
}