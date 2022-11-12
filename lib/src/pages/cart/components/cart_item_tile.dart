import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/custom/quantity_widget.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/services/utils-services.dart';

class CartItemTile extends StatefulWidget {
  final CartItemModel cart;
  final Function(CartItemModel) remove;

  const CartItemTile({super.key, required this.cart, required this.remove});

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  final utilServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          leading: Image.asset(
            widget.cart.item.imgUrl,
            height: 60,
            width: 60,
          ),
          title: Text(
            widget.cart.item.itemName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            utilServices.priceToCurrency(widget.cart.totalPrice()),
            style: TextStyle(
              color: CustomColors.customSwatchColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: QuantityWidget(
            sufixText: widget.cart.item.unit,
            value: widget.cart.quantity,
            isRemovable: true,
            total: (quantity) {
              setState(() {
                widget.cart.quantity = quantity;

                if (quantity == 0) {
                  widget.remove(widget.cart);
                }
              });
            },
          ),
        ));
  }
}
