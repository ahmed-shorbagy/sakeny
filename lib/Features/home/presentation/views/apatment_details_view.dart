import 'package:flutter/material.dart';
import 'package:sakeny/Features/home/data/Models/apartment_model.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/Custom_app_bar.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_images_slider.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/rental_buttons.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/row_of_apartmentDetails.dart';

class ApartmentDetailsView extends StatelessWidget {
  const ApartmentDetailsView({super.key, required this.apartment});
  final ApartmentModel apartment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomAppBar(
                title: 'Apartment Details',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: CustomImagesSlider(apartment: apartment),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: RowOfApartmentDetails(
                  title: 'Single Bed',
                  numberofBeds: apartment.numberOfSingleBeds ?? '',
                  price: apartment.priceOfOneBedInSingleBeds ?? '',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: RowOfApartmentDetails(
                  title: 'Double Bed',
                  numberofBeds: apartment.numberOfDoubleBeds ?? '',
                  price: apartment.priceOfOneBedInDoubleBeds ?? '',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: RowOfApartmentDetails(
                  title: 'Triple Bed',
                  numberofBeds: apartment.numberOfTripleBeds ?? '',
                  price: apartment.priceOfOneBedInTripleBeds ?? '',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: ExpansionTile(
                  title: Text('Description',
                      style: Theme.of(context).textTheme.bodyLarge),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary)),
                  collapsedShape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.outline)),
                  children: [Text('${apartment.userDescription}')],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: RentalButtons(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
