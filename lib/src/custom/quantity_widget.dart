import 'package:flutter/material.dart';
import 'package:greengrocer/src/custom/quantity_button_widget.dart';

class QuantityWidget extends StatelessWidget {
  final int value;
  final String sufixText;
  final bool isRemovable;
  final Function(int quantity) total;

  const QuantityWidget(
      {super.key,
      required this.value,
      required this.sufixText,
      this.isRemovable = false,
      required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          QuantityButtonWidget(
              icon: !isRemovable || value > 1
                  ? Icons.remove
                  : Icons.delete_forever,
              color: !isRemovable || value > 1 ? Colors.grey : Colors.red,
              onPressed: () {
                if (value == 1 && !isRemovable) {
                  return;
                }

                int count = value - 1;
                total(count);
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              '$value $sufixText',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          QuantityButtonWidget(
              icon: Icons.add,
              color: Colors.green,
              onPressed: () {
                int count = value + 1;
                total(count);
              })
        ],
      ),
    );
  }
}
