import 'package:bloc_rest_api/core/utils/di/di_locator.dart';
import 'package:bloc_rest_api/presentation/home/controller/home_controller.dart';
import 'package:bloc_rest_api/presentation/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'presentation/home/bloc/home_bloc.dart';

void main() {
  initDI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final HomeController _homeController =
      Get.put<HomeController>(HomeController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => HomeBloc(),
        child: HomeView(),
      ),
    );
  }
}
