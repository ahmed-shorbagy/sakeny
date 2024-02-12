import 'package:flutter/material.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/Custom_app_bar.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_image_slector.dart';

class AddNewAppartmentView extends StatelessWidget {
  const AddNewAppartmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [CustomAppBar(), CustomImageSelector()],
        ),
      ),
    );
  }
}
