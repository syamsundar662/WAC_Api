import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_and_craft/model/model.dart';
import 'package:web_and_craft/view%20model/home_viewmodel.dart';
import 'package:web_and_craft/view/widget/banner_slider_widget.dart';
import 'package:web_and_craft/view/widget/category_widget.dart';
import 'package:web_and_craft/view/widget/product_widget.dart';
import 'package:web_and_craft/view/widget/single_banner_widget.dart';

class HomeScreen extends StatelessWidget {
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Category Page'),
    Text('Cart Page'),
    Text('Offers Page'),
    Text('Account Page'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 147, 200, 72),
        leading: Icon(Icons.shopping_cart_outlined),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active_outlined),
            onPressed: () {},
          ),
        ],
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(50.0),
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: TextField(
        //       decoration: InputDecoration(
        //         hintText: 'Search',
        //         filled: true,
        //         fillColor: Colors.white,
        //         prefixIcon: Icon(Icons.search),
        //         border: OutlineInputBorder(
        //           borderRadius: BorderRadius.circular(30),
        //           borderSide: BorderSide.none,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ),
      body: Selector<HomeViewModel, int>(
        selector: (_, viewModel) => viewModel.selectedIndex,
        builder: (context, selectedIndex, child) {
          if (selectedIndex == 0) {
            return Selector<HomeViewModel, List<Model>>(
              selector: (_, viewModel) => viewModel.data,
              builder: (context, data, child) {
                return data.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final item = data[index];
                          if (item.type == 'catagories') {
                            return CategoryWidget(item.contents!);
                          } else if (item.type == 'banner_slider') {
                            return BannerSliderWidget(item.contents!);
                          } else if (item.type == 'banner_single') {
                            return SingleBannerWidget(item.imageUrl!);
                          } else if (item.type == 'products') {
                            return ProductWidget(item.contents!);
                          }
                          return Container();
                        },
                      );
              },
            );
          } else {
            return Center(child: _widgetOptions.elementAt(selectedIndex));
          }
        },
      ),
      bottomNavigationBar: Selector<HomeViewModel, int>(
        selector: (_, viewModel) => viewModel.selectedIndex,
        builder: (context, selectedIndex, child) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Category'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_offer), label: 'Offers'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: 'Account'),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.green,
            onTap: (index) {
              context.read<HomeViewModel>().setSelectedIndex(index);
            },
          );
        },
      ),
    );
  }
}
