import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sakeny/Features/home/presentation/manager/fetch_apartments_cubit.dart/fetch_apartments_cubit.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_apartment_type_buttons.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_slider.dart';
import 'package:sakeny/generated/l10n.dart';

class CustomBottomSheetColumn extends StatefulWidget {
  const CustomBottomSheetColumn({
    super.key,
  });

  @override
  State<CustomBottomSheetColumn> createState() =>
      _CustomBottomSheetColumnState();
}

class _CustomBottomSheetColumnState extends State<CustomBottomSheetColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            S.of(context).RoomType,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStatePropertyAll<BorderSide>(
                      BorderSide(
                          color: isSingle
                              ? Theme.of(context).colorScheme.secondary
                              : Colors.transparent,
                          width: 2),
                    ),
                  ),
                  onPressed: () async {
                    setState(() {
                      isSingle = !isSingle;
                    });
                    await BlocProvider.of<FetchApartmentsCubit>(context)
                        .fetchFilteredApartments(
                            pageNumber: 1,
                            isSingle: isSingle,
                            isDouble: isDouble,
                            isTriple: isTriple,
                            isForFemales: isForFemales,
                            isForMales: isForMales);
                  },
                  child: Text(S.of(context).SingleBed,
                      style: Theme.of(context).textTheme.bodyMedium!),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStatePropertyAll<BorderSide>(
                      BorderSide(
                          color: isDouble
                              ? Theme.of(context).colorScheme.secondary
                              : Colors.transparent,
                          width: 2),
                    ),
                  ),
                  onPressed: () async {
                    setState(() {
                      isDouble = !isDouble;
                    });
                    await BlocProvider.of<FetchApartmentsCubit>(context)
                        .fetchFilteredApartments(
                            pageNumber: 1,
                            isSingle: isSingle,
                            isDouble: isDouble,
                            isTriple: isTriple,
                            isForFemales: isForFemales,
                            isForMales: isForMales);
                  },
                  child: Text(S.of(context).TripleBed,
                      style: Theme.of(context).textTheme.bodyMedium!),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStatePropertyAll<BorderSide>(
                      BorderSide(
                          color: isTriple
                              ? Theme.of(context).colorScheme.secondary
                              : Colors.transparent,
                          width: 2),
                    ),
                  ),
                  onPressed: () async {
                    setState(() {
                      isTriple = !isTriple;
                    });
                    await BlocProvider.of<FetchApartmentsCubit>(context)
                        .fetchFilteredApartments(
                            pageNumber: 1,
                            isSingle: isSingle,
                            isDouble: isDouble,
                            isTriple: isTriple,
                            isForFemales: isForFemales,
                            isForMales: isForMales);
                  },
                  child: Text(S.of(context).DoubleBed,
                      style: Theme.of(context).textTheme.bodyMedium!),
                ),
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        const CustomSlider(),
        LottieBuilder.asset(
          'assets/jsons/Animation - 1710158010599.json',
          height: 50,
          width: 100,
        ),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
