import 'package:flutter/cupertino.dart';

class CartNotifier extends ChangeNotifier {
  final selecteditems = <String>[];
  void addone(String name) {
    selecteditems.add(name);
    notifyListeners();
  }

  void removeone(String name) {
    selecteditems.remove(name);
    notifyListeners();
  }
}
