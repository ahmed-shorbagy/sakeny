import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomImageSelector extends StatefulWidget {
  const CustomImageSelector({Key? key}) : super(key: key);

  @override
  State<CustomImageSelector> createState() => _CustomImageSelectorState();
}

class _CustomImageSelectorState extends State<CustomImageSelector> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];

  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      setState(() {
        imageFileList.addAll(selectedImages);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectImages,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary, // Placeholder color
            ),
            child: imageFileList.isNotEmpty
                ? CarouselSlider.builder(
                    itemCount: imageFileList.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: double.infinity,
                      child: Image.file(
                        File(imageFileList[itemIndex].path),
                        fit: BoxFit.fill,
                      ),
                    ),
                    options: CarouselOptions(
                      viewportFraction: 0.7,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      animateToClosest: true,
                    ),
                  )
                : Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'UPLOAD UP TO 6 PHOTOS',
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const Icon(FontAwesomeIcons.arrowRight)
                            ],
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Tap to select images',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
