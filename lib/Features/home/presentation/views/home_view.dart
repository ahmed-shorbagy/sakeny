import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sakeny/Features/auth/data/repos/auth_repo.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_button.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:sakeny/core/models/user_cubit/user_cubit_cubit.dart';
import 'package:sakeny/core/utils/size_config.dart';

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
        SliverAppBar(
          floating: true,
          actions: [
            CustomButton(
                onPressed: () {},
                child: const Icon(
                  Icons.tune_outlined,
                )),
            SizedBox(
              width: SizeConfig.screenwidth! * 0.04,
            )
          ],
          expandedHeight: SizeConfig.screenhieght! * 0.1,
          backgroundColor: Colors.transparent,
          title: Text(
            'Hello, ${UserCubit.user.name}',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SliverList.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.all(8),
                child: CustomListViewItem(),
              );
            })
      ]),
    );
  }
}
