import 'package:stonepro/src/model/remain.dart';
import 'package:stonepro/src/model/stone.dart';
import 'package:stonepro/src/remain/components/remain_form.dart';
import 'package:stonepro/src/remain/remain_controller.dart';
import 'package:stonepro/src/remain/remain_repository.dart';
import 'package:stonepro/src/state/state_app.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RemainScreen extends StatefulWidget {
  const RemainScreen({super.key, required this.stone, this.remain});

  final Stone stone;
  final Remain? remain;

  @override
  State<RemainScreen> createState() => _RemainScreenState();
}

class _RemainScreenState extends State<RemainScreen> {
  RemainController remainController = RemainController(StateApp.start, RemainRepository());

  @override
  void initState() {
    remainController.stone = widget.stone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Remain")),
      body: RemainForm(
        remainController: remainController,
        remain: widget.remain,
      ),
    );
  }
}
