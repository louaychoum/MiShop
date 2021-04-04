import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/main_drawer.dart';
import './splash_screen.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  Future _ordersFuture;

  Future _obtainOrdersFuture() {
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    _ordersFuture = _obtainOrdersFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final orderData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Orders 🗃'),
          centerTitle: true,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
        ),
        drawer: MainDrawer(),
        body: FutureBuilder(
          future: _ordersFuture,
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.error != null) {
                //.. error
                return Center(
                  child: Text('An error ocurred!'),
                );
              } else {
                return Consumer<Orders>(
                  builder: (context, orderData, child) =>
                      orderData.orders.length > 0
                          ? ListView.builder(
                              itemCount: orderData.orders.length,
                              itemBuilder: (ctx, i) => OrderItem(
                                orderData.orders[i],
                              ),
                            )
                          : Center(
                              child: Text(
                                'No Orders yet... 🕸',
                                style: TextStyle(
                                    fontSize: 34, color: Colors.black45),
                              ),
                            ),
                );
              }
            }
          },
        ));
  }
}
