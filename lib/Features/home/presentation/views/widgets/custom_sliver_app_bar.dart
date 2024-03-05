import 'package:flutter/material.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_button.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_bottom_sheet_column.dart';
import 'package:sakeny/core/models/user_cubit/user_cubit_cubit.dart';
import 'package:sakeny/core/utils/size_config.dart';

class CustomSliverAppBar extends StatefulWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      actions: [
        CustomButton(
            onPressed: () {
              showModalBottomSheet<void>(
                  showDragHandle: true,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  transitionAnimationController: AnimationController(
                      vsync: this, duration: const Duration(milliseconds: 600)),
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: SizeConfig.screenhieght! * 0.3,
                      color: Theme.of(context).colorScheme.background,
                      child: const Center(
                        child: CustomBottomSheetColumn(),
                      ),
                    );
                  });
            },
            child: const Icon(
              Icons.tune_outlined,
            )),
        SizedBox(
          width: SizeConfig.screenwidth! * 0.04,
        )
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        'Hello, ${UserCubit.user.name}',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
