import 'package:stonepro/src/home/components/item.dart';
import 'package:stonepro/src/home/home_controller.dart';
import 'package:stonepro/src/home/home_repository.dart';
import 'package:stonepro/src/state/state_app.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = HomeController(StateApp.start, HomeRepository());

  @override
  void initState() {
    initFind();
    super.initState();
  }

  initFind() async {
    print("açsldkjfaçslkdfasdf");
    await _homeController.find();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedras"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => initFind(),
        child: Stack(
          children: [
            ListView(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ValueListenableBuilder(
                  valueListenable: _homeController.stateFind,
                  builder: (context, value, child) {
                    return value == StateApp.loading
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            children: _homeController.stones!.map((stone) {
                            return Item(stone: stone);
                          }).toList());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
