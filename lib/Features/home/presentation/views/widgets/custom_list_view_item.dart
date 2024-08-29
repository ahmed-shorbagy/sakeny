import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:sakeny/Features/favorites/data/Repos/favorites_repo.dart';
import 'package:sakeny/Features/home/data/Models/apartment_model.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_favorite_icon.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/row_of_floating_details.dart';
import 'package:sakeny/core/utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return GestureDetector(
      onTap: onTaped,
      child: Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: CachedNetworkImage(
                    imageUrl: (apartment.photosUrls?.firstOrNull) ??
                        'https://www.propertyfinder.eg/property/5d26952486a6c5c833f75721305d3c55/416/272/MODE/d6ab15/4831082-47434o.webp?ctr=eg',
                    height: SizeConfig.screenhieght! * 0.25,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: CustomFavoriteIcon(
                    apartmentId: apartment.apartmentID ?? '',
                    favoritesRepository: FavoritesRepository(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    apartment.userDescription ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  RowOfFloatingDetails(apartment: apartment),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${apartment.priceOfOneBedInDoubleBeds ?? 'N/A'}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Theme.of(context).colorScheme.outline,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(FontAwesomeIcons.whatsapp,
                                color: Colors.green),
                            onPressed: () => openWhatsapp(
                                context: context,
                                text:
                                    "هل هذه الشقة متاحة ؟ السعر هو ${apartment.apartmentID ?? 'N/A'} ${apartment.userDescription ?? 'N/A'}",
                                number: '+201021416332'),
                          ),
                          IconButton(
                            icon: const Icon(Icons.phone, color: Colors.blue),
                            onPressed: () => _launchPhone(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchWhatsApp(BuildContext context) async {
    String phoneNumber =
        '+2001021416332'; // Correctly formatted phone number without '+'
    final Uri whatsappUrl = Uri.parse("https://wa.me/$phoneNumber");
    if (await canLaunchUrl(whatsappUrl)) {
      final bool launched =
          await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
      if (!launched) {
        log('Could not launch WhatsApp');
        _showErrorDialog(context, 'Could not launch WhatsApp');
      }
    } else {
      log('Could not launch WhatsApp');
      _showErrorDialog(context, 'Could not launch WhatsApp');
    }
  }

  void openWhatsapp(
      {required BuildContext context,
      required String text,
      required String number}) async {
    var whatsapp = number; //+92xx enter like this
    var whatsappURlAndroid = "whatsapp://send?phone=$whatsapp&text=$text";
    var whatsappURLIos = "https://wa.me/$whatsapp?text=${Uri.tryParse(text)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    }
  }

  Future<void> _launchPhone(BuildContext context) async {
    String phoneNumber = '+201021416332'; // Replace with the actual number
    final Uri phoneUrl = Uri.parse("tel:$phoneNumber");
    if (await canLaunchUrl(phoneUrl)) {
      final bool launched = await launchUrl(phoneUrl);
      if (!launched) {
        _showErrorDialog(context, 'Could not launch Phone app');
      }
    } else {
      _showErrorDialog(context, 'Could not launch Phone app');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
