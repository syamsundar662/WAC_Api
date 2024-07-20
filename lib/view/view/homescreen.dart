// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:web_and_craft/model/model.dart';
// import 'package:web_and_craft/view%20model/home_viewmodel.dart';
// import 'package:web_and_craft/view/widget/banner_slider_widget.dart';
// import 'package:web_and_craft/view/widget/category_widget.dart';
// import 'package:web_and_craft/view/widget/product_widget.dart';
// import 'package:web_and_craft/view/widget/single_banner_widget.dart';

// class HomeScreen extends StatelessWidget {
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text('Home Page'),
//     Text('Category Page'),
//     Text('Cart Page'),
//     Text('Offers Page'),
//     Text('Account Page'),
//   ];

//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(70),
//         child: AppBar(
//           backgroundColor: Color.fromARGB(255, 147, 200, 72),
//           leading: Icon(Icons.shopping_cart_outlined),
//           title: TextField(
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//               suffixIcon: Icon(Icons.search),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//           actions: [
//             IconButton(
//               icon: Icon(
//                 Icons.notifications_active_outlined,
//                 color: Colors.white,
//               ),
//               onPressed: () {},
//             ),
//           ],
//         ),
//       ),
//       body: Selector<HomeViewModel, int>(
//         selector: (_, viewModel) => viewModel.selectedIndex,
//         builder: (context, selectedIndex, child) {
//           if (selectedIndex == 0) {
//             return Selector<HomeViewModel, List<Model>>(
//               selector: (_, viewModel) => viewModel.data,
//               builder: (context, data, child) {
//                 return data.isEmpty
//                     ? Center(child: CircularProgressIndicator())
//                     : ListView.builder(
//                         itemCount: data.length,
//                         itemBuilder: (context, index) {
//                           final item = data[index];
//                           if (item.type == 'catagories') {
//                             return CategoryWidget(item.contents!);
//                           } else if (item.type == 'banner_slider') {
//                             return BannerSliderWidget(item.contents!);
//                           } else if (item.type == 'banner_single') {
//                             return SingleBannerWidget(item.imageUrl!);
//                           } else if (item.type == 'products') {
//                             return ProductWidget(item.contents!);
//                           }
//                           return Container();
//                         },
//                       );
//               },
//             );
//           } else {
//             return Center(child: _widgetOptions.elementAt(selectedIndex));
//           }
//         },
//       ),
//       bottomNavigationBar: Selector<HomeViewModel, int>(

//         selector: (_, viewModel) => viewModel.selectedIndex,
//         builder: (context, selectedIndex, child) {
//           return BottomNavigationBar(
//             enableFeedback: true,
//             backgroundColor: Colors.amber,
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.category), label: 'Category'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.shopping_cart), label: 'Cart'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.local_offer), label: 'Offers'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.account_circle), label: 'Account'),
//             ],
//             currentIndex: selectedIndex,
//             unselectedItemColor: Colors.grey[400],
//             unselectedLabelStyle: TextStyle(color: Colors.grey[400]),
//             selectedItemColor: Colors.green,

//             onTap: (index) {
//               context.read<HomeViewModel>().setSelectedIndex(index);
//             },
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_and_craft/model/model.dart';
import 'package:web_and_craft/view%20model/home_viewmodel.dart';
import 'package:web_and_craft/view/widget/banner_slider_widget.dart';
import 'package:web_and_craft/view/widget/category_widget.dart';
import 'package:web_and_craft/view/widget/product_widget.dart';
import 'package:web_and_craft/view/widget/single_banner_widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

class HomeScreen extends StatelessWidget {
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Category Page'),
    Text('Cart Page'),
    Text('Offers Page'),
    Text('Account Page'),
  ];

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 147, 200, 72),
          leading: Icon(Icons.shopping_cart_outlined),
          title: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications_active_outlined,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
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
          return MotionTabBar(
            
            initialSelectedTab: "Home",
            useSafeArea: true,
            labels: const ["Home", "Category", "Cart", "Offers", "Account"],
            icons: const [
              Icons.home,
              Icons.category,
              Icons.shopping_cart,
              Icons.local_offer,
              Icons.account_circle,
            ],
            tabSize: 50,
            tabBarHeight: 60,
            textStyle: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
            tabIconColor: Colors.grey[600],
            tabIconSize: 28.0,
            tabIconSelectedSize: 26.0,
            tabSelectedColor: Colors.green,
            tabIconSelectedColor: Colors.white,
            tabBarColor: Color.fromARGB(255, 212, 212, 212),
            onTabItemSelected: (int index) {
              context.read<HomeViewModel>().setSelectedIndex(index);
            },
          );
        },
      ),
    );
  }
}
