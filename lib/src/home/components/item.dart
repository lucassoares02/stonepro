import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stonepro/route/app_router.dart';
import 'package:stonepro/src/components/image_bucket.dart';
import 'package:stonepro/src/model/stone.dart';

class Item extends StatelessWidget {
  const Item({Key? key, required this.stone}) : super(key: key);

  final Stone stone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(StoneRoute(stone: stone));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageBucket(urlImage: stone.image!, height: 100),
              const SizedBox(height: 10),
              Text(
                stone.name!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(stone.description!),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.business, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text("${stone.provider!.name}"),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.work, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text("${stone.manufacturer!.businessName}"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
