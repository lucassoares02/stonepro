import 'package:flutter/material.dart';
import 'package:stonepro/src/uitls/decoration.dart';

class InputComponent extends StatefulWidget {
  const InputComponent(
      {super.key, this.label = "", required this.textEditingController, required this.validator, this.value});

  final String? label;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final String? value;

  @override
  State<InputComponent> createState() => _InputComponentState();
}

class _InputComponentState extends State<InputComponent> {
  @override
  Widget build(BuildContext context) {
    return widget.value == null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.label}",
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: widget.textEditingController,
                decoration: inputDecorationEnabled(),
                validator: widget.validator,
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.label}",
                style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              ),
              Text(
                "${widget.value}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          );
  }
}
