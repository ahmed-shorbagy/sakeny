import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sakeny/Features/auth/data/repos/auth_repo.dart';
import 'package:sakeny/core/models/user_cubit/user_cubit_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
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
    return const Scaffold(
      body: Column(),
    );
  }
}
