import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sakeny/Features/home/presentation/manager/fetch_apartments_cubit.dart/fetch_apartments_cubit.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_apartment_type_buttons.dart';

class SliderValueProvider extends ChangeNotifier {
  double _currentSliderValue = 3000;

  double get currentSliderValue => _currentSliderValue;

  void setCurrentSliderValue(double value) {
    _currentSliderValue = value;
    notifyListeners();
  }
}

class CustomSlider extends StatelessWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double currentSliderValue =
        Provider.of<SliderValueProvider>(context).currentSliderValue;

    return Slider(
      max: 3000,
      divisions: 40,
      activeColor: Theme.of(context).colorScheme.secondary,
      inactiveColor: Colors.grey,
      label: currentSliderValue.round().toString(),
      value: currentSliderValue,
      onChanged: (value) async {
        Provider.of<SliderValueProvider>(context, listen: false)
            .setCurrentSliderValue(value);

        await BlocProvider.of<FetchApartmentsCubit>(context)
            .fetchFilteredApartments(
          pageNumber: 1,
          isSingle: isSingle,
          isDouble: isDouble,
          isTriple: isTriple,
          isForFemales: isForFemales,
          isForMales: isForMales,
          maxPrice: value,
        );
      },
    );
  }
}
