import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/orders.dart' show Orders;
import '../widget/order_item.dart';
import '../widget/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

//  @override
//  _OrdersScreenState createState() => _OrdersScreenState();
//}
//
//class _OrdersScreenState extends State<OrdersScreen> {
//  var _isLoading = false;
//  @override
//  void initState() {
////    _isLoading = true;
////    Provider.of<Orders>(context, listen: false).fetchAndSetOrders().then((_) {
////      setState(() {
////        _isLoading = false;
////      });
////    });
//
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
//    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error != null) {
              // ...
              // do error handling stuff
              return Center(
                child: Text('an error occurred!'),
              );
            } else {
              return Consumer<Orders>(
                builder: (ctx, orderData, child) => ListView.builder(
                  itemCount: orderData.orders.length,
                  itemBuilder: (ctx, i) => OrderItem(
                    orderData.orders[i],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
