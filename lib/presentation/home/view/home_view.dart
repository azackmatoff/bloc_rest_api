import 'package:bloc_rest_api/presentation/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _homeController = HomeController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_homeController.isLoading.value)
                  const CircularProgressIndicator()
                else
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _homeController.users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 28, bottom: 12.0),
                        child: ListTile(
                          leading:
                              Text(_homeController.users[index].id!.toString()),
                          title: Text(_homeController.users[index].name!),
                          subtitle:
                              Text(_homeController.users[index].company!.name!),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
