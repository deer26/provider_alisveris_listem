import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:providerornek/model/item_model.dart';

class ChartProvider extends ChangeNotifier {
  List<ItemModel> _urunListem = [
    ItemModel(
      urun: "Elma",
      fiyat: 4.50,
    ),
    ItemModel(urun: "Armut", fiyat: 7.50),
    ItemModel(urun: "Peynir", fiyat: 50.50),
    ItemModel(urun: "Sucuk", fiyat: 65.75),
    ItemModel(urun: "Kıyma", fiyat: 53.50),
    ItemModel(urun: "Z.yağı", fiyat: 74.25),
  ];

  ThemeData _tema = ThemeData.light();

  ThemeData getTema() => _tema;
  double _totalPrice = 0;
  double get totalPrice => _totalPrice;
  List<ItemModel> _sepetUrunlerim = [];

  List<ItemModel> getUrunlerim() => _urunListem;
  List<ItemModel> getSepetim() => _sepetUrunlerim;

  sepetIslemi(ItemModel item) {
    if (_sepetUrunlerim.contains(item)) {
      _sepetUrunlerim.remove(item);
      _totalPrice -= item.fiyat;
    } else {
      _sepetUrunlerim.add(item);
      _totalPrice += item.fiyat;
    }
    notifyListeners();
  }
}
