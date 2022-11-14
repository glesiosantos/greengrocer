import 'package:flutter/cupertino.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/services/utils-services.dart';

class OrderItemDetails extends StatelessWidget {
  final CartItemModel item;
  final utilService = UtilsServices();

  OrderItemDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Text(
            '${item.quantity} ${item.item.unit} ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(item.item.itemName)),
          Text(utilService.priceToCurrency(item.totalPrice()))
        ],
      ),
    );
  }
}
