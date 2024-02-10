import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stonepro/route/app_router.dart';
import 'package:stonepro/src/components/image_bucket.dart';
import 'package:stonepro/src/model/stone.dart';
import 'package:stonepro/src/stone/components/item.dart';
import 'package:stonepro/src/uitls/spacing.dart';

@RoutePage()
class StoneScreen extends StatefulWidget {
  const StoneScreen({super.key, required this.stone});

  final Stone stone;

  @override
  State<StoneScreen> createState() => _StoneScreenState();
}

class _StoneScreenState extends State<StoneScreen> {
  @override
  Widget build(BuildContext context) {
    inspect(widget.stone);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageBucket(urlImage: widget.stone.image!, height: 300),
                  const SizedBox(height: 10),
                  Text(
                    widget.stone.name!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildDetalhesItem('Descrição', Text(widget.stone.description!), icon: Icons.description_outlined),
                  _buildDetalhesItem('Provedor', Text("${widget.stone.provider!.name}"), icon: Icons.business),
                  _buildDetalhesItem('Fabricante', Text("${widget.stone.manufacturer!.businessName}"),
                      icon: Icons.work),
                ],
              ),
            ),
            _buildDetalhesItem(
                'Sobras',
                marginTitle: 16,
                leading: IconButton(
                    onPressed: () {
                      AutoRouter.of(context).push(RemainRoute(stone: widget.stone));
                    },
                    icon: const Icon(Icons.add)),
                SizedBox(
                  height: 300,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: widget.stone.remains!.map((remain) {
                        return Item(remain: remain!, stone: widget.stone);
                      }).toList()),
                ),
                icon: Icons.restart_alt),
          ],
        ),
      ),
    );
  }

  Widget _buildDetalhesItem(String title, Widget content, {IconData? icon, double marginTitle = 0, Widget? leading}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (icon != null)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: marginTitle),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                leading ?? Container(),
              ],
            ),
          ),
        const SizedBox(height: 5),
        content,
        const SizedBox(height: 20),
      ],
    );
  }
}
