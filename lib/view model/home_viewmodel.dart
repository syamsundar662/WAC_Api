import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_and_craft/model/model.dart';
import 'package:web_and_craft/services/api_service.dart';
import 'package:web_and_craft/services/local_database_service.dart';

class HomeViewModel extends ChangeNotifier {
  List<Model> _data = [];
  int _selectedIndex = 0;
  final ApiService _apiService;
  final DatabaseHelper _dbHelper = DatabaseHelper();

  List<Model> get data => _data;
  int get selectedIndex => _selectedIndex;

  HomeViewModel(this._apiService) {
    fetchData(); 
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<void> fetchData() async {
    try {
      _data = await _apiService.fetchData();

      // Store the fetched data in the database
      await _dbHelper.insertData(json.encode(_data));

      notifyListeners();
    } catch (e) {
      print('Error fetching data: $e');

      // If there is an error, try to load data from the database
      await loadDataFromDatabase();
    }
  }

  Future<void> loadDataFromDatabase() async {
    try {
      _data = await _dbHelper.fetchData();
      notifyListeners();
    } catch (e) {
      print('Error loading data from database: $e');
    }
  }
}
