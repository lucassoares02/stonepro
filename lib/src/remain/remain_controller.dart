import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:stonepro/src/model/remain.dart';
import 'package:stonepro/src/model/stone.dart';
import 'package:stonepro/src/remain/remain_repository.dart';
import 'package:stonepro/src/state/state_app.dart';

class RemainController extends ValueNotifier {
  RemainController(super.value, this.remainRepository);

  final RemainRepository remainRepository;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  List<File> images = [];
  List<String> idImages = [];
  List<Remain>? remains;
  final stateFind = ValueNotifier<StateApp>(StateApp.start);
  final stateCreate = ValueNotifier<StateApp>(StateApp.start);
  final stateSaveFiles = ValueNotifier<StateApp>(StateApp.start);
  Stone? stone;

  Future find() async {
    stateFind.value = StateApp.loading;
    try {
      remains = await remainRepository.findAll();
      stateFind.value = StateApp.success;
    } catch (error) {
      debugPrint("Error (Remain Controller) Find: $error");
      stateFind.value = StateApp.error;
    }
  }

  Future create() async {
    stateCreate.value = StateApp.loading;
    idImages = [];
    try {
      if (images.isNotEmpty) await saveFiles();

      await remainRepository.createOne(
          Remain(
            description: descriptionController.text,
            width: widthController.text,
            length: lengthController.text,
            stone: stone!.id,
            responsible: 1,
          ),
          idImages);
      stateCreate.value = StateApp.success;
    } catch (e) {
      debugPrint("Error (Remain Controller) Create: $e");
      stateCreate.value = StateApp.error;
    }
  }

  Future saveFiles() async {
    stateSaveFiles.value = StateApp.loading;
    try {
      for (var image in images) {
        Uint8List bytes = await image.readAsBytes();
        String filename = "${Random().nextInt(10000)}.png";
        String id = await remainRepository.uploadFile(bytes, filename);
        idImages.add(id);
      }
      stateSaveFiles.value = StateApp.success;
    } catch (e) {
      debugPrint("Error (Remain Controller) Save File: $e");
      stateSaveFiles.value = StateApp.error;
      rethrow;
    }
  }
}
