import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeny/Features/auth/data/repos/auth_repo.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_bottom_bar.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_sliver_app_bar.dart';
import 'package:sakeny/core/models/user_cubit/user_cubit_cubit.dart';
import 'package:sakeny/core/utils/App_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    log(
      UserCubit.user.name,
    );
    log(
      UserCubit.user.email,
    );
    log(
      UserCubit.user.isStudent.toString(),
    );

    log(
      UserCubit.user.photoUrl ?? 'nooo',
    );
    log(
      auth.currentUser?.uid ?? 'nooo',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        const CustomSliverAppBar(),
        SliverList.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.all(8),
                child: CustomListViewItem(),
              );
            }),
      ]),
      bottomNavigationBar: const CustomBottomBar(),
      floatingActionButton: UserCubit.user.isStudent!
          ? FloatingActionButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kAddNewAppartmentView);
              },
              elevation: 2.5,
              child: Icon(
                FontAwesomeIcons.plus,
                color: Theme.of(context).colorScheme.outline,
              ),
            )
          : null,
    );
  }
}
