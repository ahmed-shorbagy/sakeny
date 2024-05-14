import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:sakeny/generated/l10n.dart';

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
                        log(apartment.toString());
                        log(UserCubit.user.toString());
                        await FireBaseAPi().sendMessage(
                          title: "New Request",
                          messageBody:
                              'user ${UserCubit.user.name} has request a new bed',
                          tokens: [
                            "dB1xPPrMRGuQ07xrhfQqrh:APA91bEPBtg6ENBvheqoL4Xr8TEc9zNAfC2qVvrk-yJplWEhvWi33Uya57-9ITQ1MuzrU_XXAho4YlUlrS6kFYK_Idmk49WiFD0qCp5o8Exp25rsfo-_Q_K6_-KrTQLWkJbsEyHaDA_r",
                            "fusqdlN_TRqIu274RSs5EC:APA91bH4PCohWyoT6G6rq_bTDcjLwBNBJ2dFzAO4DcNtv-8YtpaYY6SYnEfqQ0FqTqNDcjjtqrJ5easAffqoLTo346du7o78KhQUn7pSUtIdY6AvyK7uJYfNLLP7U1RzvOUVC-KfRht1"
                          ],
                        );

                        RequestModel request = RequestModel(
                            apartment: apartment,
                            user: UserCubit.user,
                            bedType: BedType.single,
                            requestTime: Timestamp.now());
                        await BlocProvider.of<RequestsCubit>(context)
                            .addNEwRequest(request: request);
                      },
                      child: Text(S.of(context).Rentasingle,
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
                        log(apartment.toString());
                        log(UserCubit.user.toString());
                        await FireBaseAPi().sendMessage(
                          title: "New Request",
                          messageBody:
                              'user ${UserCubit.user.name} has request a new bed',
                          tokens: [
                            "dB1xPPrMRGuQ07xrhfQqrh:APA91bEPBtg6ENBvheqoL4Xr8TEc9zNAfC2qVvrk-yJplWEhvWi33Uya57-9ITQ1MuzrU_XXAho4YlUlrS6kFYK_Idmk49WiFD0qCp5o8Exp25rsfo-_Q_K6_-KrTQLWkJbsEyHaDA_r",
                            "fusqdlN_TRqIu274RSs5EC:APA91bH4PCohWyoT6G6rq_bTDcjLwBNBJ2dFzAO4DcNtv-8YtpaYY6SYnEfqQ0FqTqNDcjjtqrJ5easAffqoLTo346du7o78KhQUn7pSUtIdY6AvyK7uJYfNLLP7U1RzvOUVC-KfRht1"
                          ],
                        );

                        RequestModel request = RequestModel(
                            apartment: apartment,
                            user: UserCubit.user,
                            bedType: BedType.doublee,
                            requestTime: Timestamp.now());
                        await BlocProvider.of<RequestsCubit>(context)
                            .addNEwRequest(request: request);
                      },
                      child: Text(S.of(context).RentADouble,
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
                        log(apartment.toString());
                        log(UserCubit.user.toString());
                        await FireBaseAPi().sendMessage(
                          title: "New Request",
                          messageBody:
                              'user ${UserCubit.user.name} has request a new bed',
                          tokens: [
                            "dB1xPPrMRGuQ07xrhfQqrh:APA91bEPBtg6ENBvheqoL4Xr8TEc9zNAfC2qVvrk-yJplWEhvWi33Uya57-9ITQ1MuzrU_XXAho4YlUlrS6kFYK_Idmk49WiFD0qCp5o8Exp25rsfo-_Q_K6_-KrTQLWkJbsEyHaDA_r",
                            "fusqdlN_TRqIu274RSs5EC:APA91bH4PCohWyoT6G6rq_bTDcjLwBNBJ2dFzAO4DcNtv-8YtpaYY6SYnEfqQ0FqTqNDcjjtqrJ5easAffqoLTo346du7o78KhQUn7pSUtIdY6AvyK7uJYfNLLP7U1RzvOUVC-KfRht1"
                          ],
                        );

                        RequestModel request = RequestModel(
                            apartment: apartment,
                            user: UserCubit.user,
                            bedType: BedType.triple,
                            requestTime: Timestamp.now());
                        await BlocProvider.of<RequestsCubit>(context)
                            .addNEwRequest(request: request);
                      },
                      child: Text(S.of(context).RentATriple,
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
