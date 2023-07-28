import 'package:flutter/material.dart';

class SelectedIndexProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  List<String> _categoryList = [];
  
  int get selectedIndex => _selectedIndex;
  List<String> get categoryList => _categoryList;
  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
  void updateCategoryList(List<Map<String, dynamic>> yoloResults) {
    // Extract the desired values (strings) from each map in yoloResults and store them in _categoryList
    _categoryList = yoloResults.map((result) => result['tag'] as String).toList();
    notifyListeners();
  }
}
