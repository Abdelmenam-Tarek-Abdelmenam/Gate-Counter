import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gate_counter/presentation/view/home_view/widgets/weight_box.dart';
import '../../resources/styles_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: PaddingManager.p10,
        height: 530.h,
        decoration: decoration(context).copyWith(
            boxShadow: StyleManager.bigShadow,
            color: Theme.of(context).colorScheme.background),
        child: Column(
          children: [
            WeightBox(),
          ],
        ),
      ),
    );
  }

  BoxDecoration decoration(BuildContext context) => BoxDecoration(
        borderRadius: StyleManager.border,
        color: Theme.of(context).colorScheme.onBackground,
      );
}
