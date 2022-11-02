import 'package:flutter/material.dart';

class CustomRowDivider extends StatelessWidget {
  const CustomRowDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              height: 10,
              color: Colors.grey.shade300,
              thickness: 2,
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15), child: Text('OU')),
          Expanded(
            child: Divider(
              height: 10,
              color: Colors.grey.shade300,
              thickness: 2,
            ),
          )
        ],
      ),
    );
  }
}
