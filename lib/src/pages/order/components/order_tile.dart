import 'package:flutter/material.dart';
import 'package:greengrocer/src/custom/payment_dialog.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/pages/order/components/order_item_details.dart';
import 'package:greengrocer/src/pages/order/components/order_status_widget.dart';
import 'package:greengrocer/src/services/utils-services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;
  final utilService = UtilsServices();

  OrderTile({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: order.status == 'pending_payment',
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pedido: ${order.id}'),
              Text(
                utilService.formatDateTime(order.createdDateTime),
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                          children: order.items
                              .map((orderItem) =>
                                  OrderItemDetails(item: orderItem))
                              .toList()),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                        status: order.status,
                        isOverdue:
                            order.overdueDateTime.isBefore(DateTime.now())),
                  )
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 20),
                children: [
                  const TextSpan(
                    text: 'Total: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: utilService.priceToCurrency(order.total),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: order.status == 'pending_payment',
              child: SizedBox(
                height: 50,
                child: ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => PaymentDialog(
                                order: order,
                              ));
                    },
                    icon: const Icon(
                      Icons.pix,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Ver QR Code PIX'.toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
