import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class StoneScreen extends StatefulWidget {
  const StoneScreen({super.key});

  @override
  State<StoneScreen> createState() => _StoneScreenState();
}

class _StoneScreenState extends State<StoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Pedra"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            AutoRouter.of(context).pop();
          },
        ),
      ),
      body: const Center(child: Text("Stone Screen")),
    );
  }
}
