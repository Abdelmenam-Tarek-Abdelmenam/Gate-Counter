import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gate_counter/data/models/records.dart';
import 'package:gate_counter/presentation/resources/string_manager.dart';
import 'package:gate_counter/presentation/resources/styles_manager.dart';

import '../../../shared/widget/directions.dart';
import '../../../shared/widget/dividers.dart';
import 'part_text.dart';

// ignore: must_be_immutable
class WeightBox extends StatelessWidget {
  WeightBox({Key? key}) : super(key: key);

  Record records = Record(items: [
    RecordItem("A", 5),
    RecordItem("B", 7),
    RecordItem("D", 6),
  ], date: "11,2,5");

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderDirection.direction(
                  topStart: StyleManager.radius10,
                ),
                color: Theme.of(context).primaryColor,
              ),
              height: 500.h,
              padding: PaddingManager.p15,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: "18",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 100.sp),
                        children: <TextSpan>[
                          TextSpan(
                              text: " ${StringManger.item}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 40.sp)),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        bigIcon(
                            context, StringManger.start, Icons.start, () {}),
                        bigIcon(context, StringManger.reset, Icons.lock_reset,
                            () {}),
                        bigIcon(context, StringManger.print,
                            Icons.print_outlined, () {}),
                      ],
                    ),
                  ),
                  FittedBox(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "15-7-2022 3:40 AM",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
        Expanded(
          flex: 1,
          child: Container(
              height: 500.h,
              decoration: BoxDecoration(
                borderRadius: BorderDirection.direction(
                  topEnd: StyleManager.radius10,
                ),
                color: Theme.of(context).colorScheme.onBackground,
              ),
              child: ListView.separated(
                itemBuilder: (context, index) => PartText(
                    records.items[index].materialId,
                    records.items[index].quantity.toString(),
                    ".00",
                    StringManger.item),
                separatorBuilder: (_, __) => Dividers.horizontalLine,
                itemCount: records.items.length,
              )),
        ),
      ],
    );
  }

  Widget bigIcon(BuildContext context, String text, IconData icon,
          VoidCallback onPressed) =>
      IconButton(
          tooltip: text,
          iconSize: 50.r,
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Theme.of(context).colorScheme.onSurface,
          ));
}
