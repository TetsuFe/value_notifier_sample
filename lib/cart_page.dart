import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_notifier.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('カート'),
      ),
      body: CartView(),
    );
  }
}

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartNotifier>(
      builder: (context, cartNotifier, _) {
        final cart = cartNotifier.value;
        if (cart == null) {
          return const CircularProgressIndicator();
        }
        return Center(
          child: Column(
            children: [
              cart.items.length == 0
                  ? Text('カートは空です。')
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text('${cart.items[index].name}'),
                        subtitle: Text('${cart.items[index].priceWithUnit}'),
                        trailing: FlatButton(
                          onPressed: () {
                            cartNotifier.remove(cart.items[index]);
                          },
                          color: Theme.of(context).accentColor,
                          child: Text('削除'),
                          textColor: Colors.white,
                        ),
                      ),
                    ),
              Text('合計金額: ${cart.totalPriceWithUnit}'),
            ],
          ),
        );
      },
    );
  }
}
