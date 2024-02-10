import 'package:flutter/material.dart';
import 'package:stonepro/src/home/home_repository.dart';
import 'package:stonepro/src/model/stone.dart';
import 'package:stonepro/src/state/state_app.dart';

class HomeController extends ValueNotifier<StateApp> {
  HomeController(super.value, this.homeRepository);

  final HomeRepository homeRepository;

  List<Stone>? stones;
  final stateFind = ValueNotifier<StateApp>(StateApp.start);

  Future find() async {
    stateFind.value = StateApp.loading;
    try {
      stones = await homeRepository.findAll();
      stateFind.value = StateApp.success;
    } catch (error) {
      debugPrint("Error (Home Controller) Find: $error");
      stateFind.value = StateApp.error;
    }
  }
}
