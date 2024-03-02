import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_button.dart';
import 'package:sakeny/Features/home/data/Models/apartment_model.dart';
import 'package:sakeny/Features/home/data/Models/request_model.dart';
import 'package:sakeny/Features/home/presentation/manager/request_cubit/requests_cubit.dart';
import 'package:sakeny/core/models/user_cubit/user_cubit_cubit.dart';
import 'package:sakeny/core/utils/App_router.dart';
import 'package:sakeny/core/utils/firebase_messaging_api.dart';
import 'package:sakeny/core/utils/helper_methodes.dart';

class RentalButtons extends StatelessWidget {
  const RentalButtons({
    super.key,
    required this.apartment,
  });
  final ApartmentModel apartment;
  @override
  Widget build(BuildContext context) {
    return BlocListener<RequestsCubit, RequestsState>(
      listener: (context, state) {
        if (state is RequestsSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.kThnakYouView);
        } else if (state is RequestsFailure) {
          snackBar(context, state.errMessage);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          apartment.numberOfSingleBeds == '0'
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                      onPressed: () async {
                        await FireBaseAPi().sendMessage(
                            title: 'new request',
                            messageBody: 'user ahmed has request to access ');
                        RequestModel request = RequestModel(
                            apartment: apartment,
                            user: UserCubit.user,
                            bedType: BedType.single);
                        await BlocProvider.of<RequestsCubit>(context)
                            .addNEwRequest(request: request);
                      },
                      child: Text('Rent a single',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.white))),
                ),
          apartment.numberOfDoubleBeds == '0'
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                      onPressed: () async {
                        RequestModel request = RequestModel(
                            apartment: apartment,
                            user: UserCubit.user,
                            bedType: BedType.doublee);
                        await BlocProvider.of<RequestsCubit>(context)
                            .addNEwRequest(request: request);
                      },
                      child: Text('Rent a Double',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.white))),
                ),
          apartment.numberOfTripleBeds == '0'
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                      onPressed: () async {
                        RequestModel request = RequestModel(
                            apartment: apartment,
                            user: UserCubit.user,
                            bedType: BedType.triple);
                        await BlocProvider.of<RequestsCubit>(context)
                            .addNEwRequest(request: request);
                      },
                      child: Text('Rent a Triple',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.white))),
                ),
        ],
      ),
    );
  }
}
