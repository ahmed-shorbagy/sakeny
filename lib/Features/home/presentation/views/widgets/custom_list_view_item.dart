import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:sakeny/Features/home/data/Models/apartment_model.dart';
import 'package:sakeny/core/utils/size_config.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({
    super.key,
    required this.apartment,
  });
  final ApartmentModel apartment;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
          border: Border(
              bottom: BorderSide(
                  style: BorderStyle.solid,
                  color: Theme.of(context).colorScheme.secondary,
                  width: 2),
              top: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 2),
              right: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 2),
              left: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 2)),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: CachedNetworkImageProvider(
              apartment.photosUrls?.first ?? '',
            ),
          ),
        ),
        height: SizeConfig.screenhieght! * 0.31,
      ),
      Positioned(
          top: SizeConfig.defaultSize,
          right: SizeConfig.defaultSize! * 2,
          child: CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.4),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
          )),
      Positioned(
          bottom: SizeConfig.defaultSize,
          left: SizeConfig.defaultSize! * 2,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bed_sharp,
                          color: Colors.white,
                          size: 18,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Text(
                        '${apartment.numberOfDoubleRooms! + apartment.numberOfSingleRooms!.toInt() + apartment.numberOfTripleRooms!.toInt()} ',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.dollarSign,
                            color: Colors.white,
                            size: 16,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text(
                          '${apartment.priceOfOneBedInDoubleroom}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    ]);
  }
}
