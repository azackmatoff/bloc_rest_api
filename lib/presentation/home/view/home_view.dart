import 'dart:developer';

import 'package:bloc_rest_api/core/utils/di/di_locator.dart';
import 'package:bloc_rest_api/data/models/user_model.dart';
import 'package:bloc_rest_api/domain/use_cases/home/get_users_use_case.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/home_bloc.dart';

class HomeView extends StatefulWidget {
  late final GetUsersUseCase getUsersUseCase;
  HomeView({Key? key})
      : getUsersUseCase = sl<GetUsersUseCase>(),
        super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // final HomeController _homeController = HomeController.instance;

  @override
  void initState() {
    context.read<HomeBloc>().add(GetUsersEvent());
    super.initState();
  }

  int count = 0;
  @override
  Widget build(BuildContext context) {
    count++;
    log('build...$count');
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child:

              /// Provider
              FutureProvider<List<UserModel>>(
            initialData: const <UserModel>[],
            create: (context) => widget.getUsersUseCase.execute(),
            child: Consumer<List<UserModel>>(
              builder: (context, users, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (users.isEmpty)
                      const CircularProgressIndicator()
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: users.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 28, bottom: 12.0),
                            child: ListTile(
                              leading: Text(users[index].id!.toString()),
                              title: Text(users[index].name!),
                              subtitle: Text(users[index].company!.name!),
                            ),
                          );
                        },
                      ),
                  ],
                );
              },
            ),
          ),

          /// bLoc
          //     BlocBuilder<HomeBloc, HomeState>(
          //   bloc: context.read<HomeBloc>(),
          //   builder: (context, state) {
          //     return Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         if (state is HomeInitial)
          //           const CircularProgressIndicator()
          //         else if (state is HomeLoaded)
          //           ListView.builder(
          //             shrinkWrap: true,
          //             itemCount: state.users.length,
          //             itemBuilder: (BuildContext context, int index) {
          //               return Padding(
          //                 padding:
          //                     const EdgeInsets.only(left: 28, bottom: 12.0),
          //                 child: ListTile(
          //                   leading: Text(state.users[index].id!.toString()),
          //                   title: Text(state.users[index].name!),
          //                   subtitle: Text(state.users[index].company!.name!),
          //                 ),
          //               );
          //             },
          //           ),
          //       ],
          //     );
          //   },
          // ),

          /// GetX
          // Obx(
          //   () => Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       if (_homeController.isLoading.value)
          //         const CircularProgressIndicator()
          //       else
          //         ListView.builder(
          //           shrinkWrap: true,
          //           itemCount: _homeController.users.length,
          //           itemBuilder: (BuildContext context, int index) {
          //             return Padding(
          //               padding: const EdgeInsets.only(left: 28, bottom: 12.0),
          //               child: ListTile(
          //                 leading:
          //                     Text(_homeController.users[index].id!.toString()),
          //                 title: Text(_homeController.users[index].name!),
          //                 subtitle:
          //                     Text(_homeController.users[index].company!.name!),
          //               ),
          //             );
          //           },
          //         ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
