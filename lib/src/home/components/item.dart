import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.name,
    required this.description,
    required this.provider,
    required this.manufacturer,
  });

  final String name;
  final String description;
  final String provider;
  final String manufacturer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text(description),
                Text(provider),
                Text(manufacturer),
                const Divider(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
