import 'package:stonepro/route/app_router.dart';
import 'package:stonepro/src/components/image_bucket.dart';
import 'package:stonepro/src/model/remain.dart';
import 'package:stonepro/src/model/stone.dart';
import 'package:stonepro/src/uitls/spacing.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Item extends StatelessWidget {
  const Item({Key? key, required this.remain, required this.stone}) : super(key: key);

  final Remain remain;
  final Stone stone;

  @override
  Widget build(BuildContext context) {
    DateTime dateHour = DateTime.parse(remain.date!);
    String formatedDate = DateFormat('dd/MM/yyyy').format(dateHour);
    String formatedHour = DateFormat('HH:mm').format(dateHour);
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(RemainRoute(stone: stone, remain: remain));
      },
      child: Container(
        width: 280,
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(appRadius), color: Colors.grey[100]),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (remain.images != null) ImageBucket(idImage: remain.images![0]),
              const SizedBox(height: 5),
              Text(
                remain.description!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.width_normal, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text("Largura: ${remain.width}"),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.height_sharp, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text("Altura: ${remain.length}"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatedDate,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      formatedHour,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
