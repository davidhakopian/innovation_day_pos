import 'package:flutter/material.dart';
import 'package:innovation_day_pos/UI/product_item.dart';

class ProductsGrid extends StatefulWidget{
  static ProductItem merch1 = new ProductItem('New York cap', 'images/NYcap.jfif');
  static ProductItem merch2 = new ProductItem('Baseball Glove', 'images/BaseballGlove.jpg');
  static ProductItem merch3 = new ProductItem('Baseball Bat', 'images/BaseballBat.jpg');
  static ProductItem merch4 = new ProductItem('Baseball Helmet', 'images/BaseballHelmet.png');
  static ProductItem merch5 = new ProductItem('Baseball Shoe', 'images/BaseballShoe.jpg');
  static ProductItem merch6 = new ProductItem('Baseball Socks', 'images/BaseballSocks.jfif');
  static ProductItem merch7 = new ProductItem('New York Jersey', 'images/NYjersey.jfif');
  static List<ProductItem> merchList = List.from([merch1, merch2, merch3, merch4, merch5, merch6, merch7]);

  static ProductItem facilities1 = new ProductItem('Field A', 'images/FieldA.jfif');
  static ProductItem facilities2 = new ProductItem('Field B', 'images/FieldB.jfif');
  static ProductItem facilities3 = new ProductItem('Field C', 'images/FieldC.jfif');
  static ProductItem facilities4 = new ProductItem('Field D', 'images/FieldD.jfif');
  static ProductItem facilities5 = new ProductItem('Field E', 'images/FieldE.jpg');
  static ProductItem facilities6 = new ProductItem('Baseball Station', 'images/BaseballStation(1).jfif');
  static List<ProductItem> FacilitiesList = List.from([facilities1, facilities2, facilities3, facilities4, facilities5, facilities6]);

  static ProductItem Multipass1 = new ProductItem('15 passes batting station', 'images/BaseballStation.jpg');
  static ProductItem Multipass2 = new ProductItem('10 passes batting station', 'images/BaseballStation.jpg');
  static ProductItem Multipass3 = new ProductItem('5 passes batting station', 'images/BaseballStation.jpg');
  static ProductItem Multipass4 = new ProductItem('Unlimited passes batting station', 'images/BaseballStation.jpg');
  static List<ProductItem> MultipassList = List.from([Multipass1, Multipass2, Multipass3, Multipass4]);

  static ProductItem Activity1 = new ProductItem('Junior Girl A', 'images/GirlBaseball.jpg');
  static ProductItem Activity2 = new ProductItem('Junior Girl AA', 'images/GirlBaseball.jpg');
  static ProductItem Activity3 = new ProductItem('Junior Girl AAA', 'images/GirlBaseball.jpg');
  static ProductItem Activity4 = new ProductItem('Junior Men A', 'images/Menbaseball.png');
  static ProductItem Activity5 = new ProductItem('Junior Men AA', 'images/Menbaseball.png');
  static ProductItem Activity6 = new ProductItem('Junior Men AAA', 'images/Menbaseball.pn');
  static ProductItem Activity7 = new ProductItem('Senior Girl A', 'images/GirlBaseball.jpg');
  static ProductItem Activity8 = new ProductItem('Senior Girl AA', 'images/GirlBaseball.jpg');
  static ProductItem Activity9 = new ProductItem('Senior Girl AAA', 'images/GirlBaseball.jpg');
  static ProductItem Activity10 = new ProductItem('Senior Men A', 'images/Menbaseball.png');
  static ProductItem Activity11 = new ProductItem('Senior Men AA', 'images/Menbaseball.png');
  static ProductItem Activity12 = new ProductItem('Senior Men AAA', 'images/Menbaseball.png');
  static List<ProductItem> ActivitiesList = List.from([Activity1, Activity2, Activity3, Activity4, Activity5, Activity6, Activity7, Activity8, Activity9,Activity10, Activity11, Activity12]);


  List<ProductItem> currentProducts = List.from(merchList);
  void Function(ProductItem item) addItemToInvoice;

  ProductsGrid(this.addItemToInvoice);

  @override
  State<StatefulWidget> createState() {
    return ProductsGridState();
  }
}

class ProductsGridState extends State<ProductsGrid>{

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this would produce 2 rows.
      crossAxisCount: 4,
      // Generate 100 Widgets that display their index in the List
      children: List.generate(widget.currentProducts.length, (index) {
        widget.currentProducts[index].onTap = widget.addItemToInvoice;
        return widget.currentProducts[index];
      }),
    );
  }
}