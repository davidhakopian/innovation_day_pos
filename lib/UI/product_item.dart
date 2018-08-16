import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math';

var rng = new Random();
class ProductItem extends StatelessWidget {

  ProductItem(this._name, this._imagePath);

  final int _id = rng.nextInt(1000000);
  final String _name;
  final String _imagePath;
  void Function(ProductItem item) onTap;

  get name => _name;
  get imagePath => _imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage(_imagePath),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(_name)
          )
        ],
      ),
    );
  }
}
