import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/user_products_screen.dart';
import '../screens/orders_screen.dart';
import '../providers/auth.dart';
import '../helpers/custom_route.dart';

class MainDrawer extends StatelessWidget {
  // Widget buildListTile(
  //   IconData icon,
  //   String title,
  //   Function tapHandler,
  // ) {
  //   return ListTile(
  //     leading: Icon(
  //       icon,
  //       size: 26,
  //     ),
  //     title: Text(
  //       title,
  //       style: TextStyle(
  //           fontFamily: 'RobotoCondensed',
  //           fontSize: 24,
  //           fontWeight: FontWeight.bold),
  //     ),
  //     onTap: tapHandler,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text(
              'My Shop 👀',
            ),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
              // Navigator.of(context).pushReplacement(
              //   CustomRoute(
              //     builder: (ctx) => OrdersScreen(),
              //   ),
              // );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                UserProductsScreen.routeName,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),

          // Container(
          //   height: 120,
          //   width: double.infinity,
          //   padding: EdgeInsets.all(20),
          //   alignment: Alignment.centerLeft,
          //   color: Theme.of(context).accentColor,
          //   child: Text(
          //     'My Shop 👀',
          //     style: TextStyle(
          //       fontWeight: FontWeight.w900,
          //       fontSize: 30,
          //       color: Theme.of(context).primaryColorDark,
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // buildListTile(
          //   Icons.home,
          //   'Home',
          //   () {
          //     Navigator.of(context).pushReplacementNamed('/');
          //   },
          // ),
          // buildListTile(
          //   Icons.receipt,
          //   'Orders',
          //   () {
          //     Navigator.of(context).pushReplacementNamed(
          //       OrdersScreen.routeName,
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
