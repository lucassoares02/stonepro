import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stonepro/src/home/components/item.dart';
import 'package:stonepro/src/model/stone.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Stone> stones = [
    Stone(id: 1, name: "Stone Blue", description: "Diamantada", manufacturer: "Logos", provider: "Atacado Pedras"),
    Stone(id: 1, name: "RedS Stone", description: "Fosca", manufacturer: "Logos", provider: "Pedras&Cia")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Pedras"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
            children: stones.map((stone) {
          return Item(
            name: stone.name!,
            description: stone.description!,
            provider: stone.provider!,
            manufacturer: stone.manufacturer!,
          );
        }).toList()),
      ),
    );
  }
}
