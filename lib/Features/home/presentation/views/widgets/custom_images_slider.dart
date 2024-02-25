import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sakeny/Features/home/data/Models/apartment_model.dart';

class CustomImagesSlider extends StatelessWidget {
  const CustomImagesSlider({
    super.key,
    required this.apartment,
  });

  final ApartmentModel apartment;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        for (int i = 0; i < apartment.photosUrls!.length; i++)
          Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 8.0), // Add margin between images
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), // Adjust border radius
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Add shadow for depth
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(16), // Clip image to rounded corners
              child: Image.network(
                apartment.photosUrls![i],
                fit: BoxFit
                    .cover, // Ensure the image covers the entire container
                width: double.infinity,
              ),
            ),
          )
      ],
      options: CarouselOptions(enlargeCenterPage: true),
    );
  }
}
