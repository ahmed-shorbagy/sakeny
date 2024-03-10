import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sakeny/Features/favorites/data/Repos/favorites_repo.dart';
import 'package:sakeny/Features/home/data/Models/apartment_model.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_favorite_icon.dart';
import 'package:sakeny/core/utils/size_config.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({
    super.key,
    required this.apartment,
    required this.onTaped,
  });
  final ApartmentModel apartment;
  final VoidCallback onTaped;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Theme.of(context).colorScheme.primary,
      child: Stack(children: [
        GestureDetector(
          onTap: onTaped,
          child: Container(
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
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2)),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: CachedNetworkImageProvider(
                  (apartment.photosUrls?.firstOrNull) ??
                      'https://www.propertyfinder.eg/property/5d26952486a6c5c833f75721305d3c55/416/272/MODE/d6ab15/4831082-47434o.webp?ctr=eg',
                ),
              ),
            ),
            height: SizeConfig.screenhieght! * 0.31,
          ),
        ),
        Positioned(
            top: SizeConfig.defaultSize,
            right: SizeConfig.defaultSize! * 2,
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.4),
              child: CustomFavoriteIcon(
                apartmentId: apartment.apartmentID ?? '',
                favoritesRepository: FavoritesRepository(),
              ),
            )),
        Positioned(
            bottom: 2,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: SizeConfig.defaultSize! * 7,
                color: Colors.black.withOpacity(0.4),
                child: Text(
                  apartment.userDescription ?? '',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                  overflow: TextOverflow.fade,
                ),
              ),
            )),
        Positioned(
          top: SizeConfig.defaultSize,
          left: SizeConfig.defaultSize! * 2,
          child: RowOfFloatingDetails(apartment: apartment),
        ),
      ]),
    );
  }
}

class RowOfFloatingDetails extends StatelessWidget {
  const RowOfFloatingDetails({
    super.key,
    required this.apartment,
  });

  final ApartmentModel apartment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
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
                  '${int.parse(apartment.numberOfDoubleBeds ?? '0') + int.parse(apartment.numberOfSingleBeds ?? '0') + int.parse(apartment.numberOfTripleBeds ?? '0')} ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
