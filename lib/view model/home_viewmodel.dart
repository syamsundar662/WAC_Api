import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:web_and_craft/model/model.dart';
import 'package:web_and_craft/services/api_service.dart';
import 'package:web_and_craft/services/local_database_service.dart';
import 'package:web_and_craft/view/widget/banner_slider_widget.dart';
import 'package:web_and_craft/view/widget/category_widget.dart';
import 'package:web_and_craft/view/widget/product_widget.dart';
import 'package:web_and_craft/view/widget/single_banner_widget.dart';

class HomeViewModel extends ChangeNotifier {
  bool homeLoading = false;
  bool isOffline = false;

  updateNetworkStatus([bool value = false]) {
    isOffline = value;
    notifyListeners();
  }

  updateLodaing([bool value = false]) {
    homeLoading = value;
    notifyListeners();
  }

  List<Model> _data = [];
  int _selectedIndex = 0;
  final ApiService _apiService;
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Widget> homePageWidgets = [];
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
    homePageWidgets = <Widget>[];
    updateLodaing(true);
    try {
      _data = await _apiService.fetchData();
      for (var item in _data) {
        switch (item.type) {
          case "banner_slider":
            final contents = item.contents;
            if ((contents ?? []).isNotEmpty) {
              homePageWidgets.add(BannerSliderWidget(contents ?? []));
            }
            continue;
          case "products":
            final contents = item.contents;
            if ((contents ?? []).isNotEmpty) {
              homePageWidgets.add(ProductWidget(
                contents ?? [],
                title: item.title,
              ));
            }
            continue;
          case "banner_single":
            final imageUrl = item.imageUrl;
            if (imageUrl != null) {
              homePageWidgets.add(SingleBannerWidget(imageUrl));
            }
            continue;
          case "catagories":
            final contents = item.contents;
            if ((contents ?? []).isNotEmpty) {
              homePageWidgets.add(CategoryWidget(contents ?? []));
            }
            continue;
          default:
        }
      }

      await _dbHelper
          .insertData(json.encode(_data.map((item) => item.toJson()).toList()));

      notifyListeners();
    } catch (e) {
      updateNetworkStatus(true);
      log('Error fetching data: $e');
      await loadDataFromDatabase();
    }
    updateLodaing();
  }

  Future<void> loadDataFromDatabase() async {
    try {
      _data = await _dbHelper.fetchData();
      homePageWidgets = <Widget>[];
      for (var item in _data) {
        switch (item.type) {
          case "banner_slider":
            final contents = item.contents;
            if ((contents ?? []).isNotEmpty) {
              homePageWidgets.add(BannerSliderWidget(contents ?? []));
            }
            continue;
          case "products":
            final contents = item.contents;
            if ((contents ?? []).isNotEmpty) {
              homePageWidgets.add(ProductWidget(
                contents ?? [],
                title: item.title,
              ));
            }
            continue;
          case "banner_single":
            final imageUrl = item.imageUrl;
            if (imageUrl != null) {
              homePageWidgets.add(SingleBannerWidget(imageUrl));
            }
            continue;
          case "catagories":
            final contents = item.contents;
            if ((contents ?? []).isNotEmpty) {
              homePageWidgets.add(CategoryWidget(contents ?? []));
            }
            continue;
          default:
        }
      }
      notifyListeners();
    } catch (e) {
      log('Error loading data from database: $e');
    }
  }
}
