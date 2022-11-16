import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/custom/custom_elevated_button.dart';
import 'package:greengrocer/src/custom/payment_dialog.dart';
import 'package:greengrocer/src/pages/cart/components/cart_item_tile.dart';
import 'package:greengrocer/src/services/utils-services.dart';
import '../../models/cart_item_model.dart';
import '../../shared/app_data.dart' as appData;

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final utilService = UtilsServices();

  removeItemFromCart(CartItemModel cartItemModel) {
    setState(() {
      appData.cartItems.remove(cartItemModel);
      utilService.showToast(
          message: 'Item removido do carrinho: ${cartItemModel.item.itemName}');
    });
  }

  double cartTotal() {
    double total = 0;

    for (var item in appData.cartItems) {
      total += item.totalPrice();
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemBuilder: (_, index) => CartItemTile(
              cart: appData.cartItems[index],
              remove: removeItemFromCart,
            ),
            itemCount: appData.cartItems.length,
          )),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 3,
                    spreadRadius: 2,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Total do Pedido',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  utilService.priceToCurrency(cartTotal()),
                  style: TextStyle(
                      fontSize: 23,
                      color: CustomColors.customSwatchColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomElevetadButton(
                    textButton: 'Concluir Pedido'.toUpperCase(),
                    onPressed: () async {
                      bool? result = await showOrderConfirmation();

                      if (result ?? false) {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              PaymentDialog(order: appData.orders.first),
                        );
                      } else {
                        utilService.showToast(
                            message: 'Pedido não confirmado', isError: true);
                      }
                    })
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('Confirmar pedido'),
          content: const Text('Deseja realmente concluir o pedido?'),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Não')),
            ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                child: const Text(
                  'Sim',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        );
      },
    );
  }
}
