import 'package:flutter/material.dart';
import 'package:sakeny/Features/home/data/Models/apartment_model.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/Custom_app_bar.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_images_slider.dart';

class ApartmentDetailsView extends StatelessWidget {
  const ApartmentDetailsView({super.key, required this.apartment});
  final ApartmentModel apartment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const CustomAppBar(
              title: 'Apartment Details',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CustomImagesSlider(apartment: apartment),
            ),
            const Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
