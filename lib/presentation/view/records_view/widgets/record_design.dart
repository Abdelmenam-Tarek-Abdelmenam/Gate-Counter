import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gate_counter/presentation/shared/widget/dividers.dart';

import '../../../../data/models/records.dart';
import '../../../resources/string_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../shared/widget/directions.dart';

class RecordDesign extends StatelessWidget {
  final Record record;
  RecordDesign(this.record, {Key? key}) : super(key: key);

  final double height = 60.r;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: StyleManager.smallShadow,
          borderRadius: StyleManager.border,
          color: Theme.of(context).colorScheme.onBackground),
      padding: PaddingManager.p10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: double.infinity,
              child: text(context, record.date, StringManger.date)),
          Row(
            children: [
              Expanded(
                child: text(context, "${record.items.length.toString()} item",
                    StringManger.itemsCount,
                    thin: true),
              ),
              Dividers.w5,
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myIcon(
                    message: StringManger.view,
                    context: context,
                    onPressed: () {},
                    icon: Icons.remove_red_eye_outlined,
                  ),
                  myIcon(
                      message: StringManger.edit,
                      context: context,
                      onPressed: () {},
                      icon: Icons.edit),
                  myIcon(
                      message: StringManger.delete,
                      context: context,
                      onPressed: () {},
                      icon: Icons.delete_outline_outlined),
                ],
              )),
            ],
          )
        ],
      ),
    );
  }

  Widget iconBox(BuildContext context) => Container(
      height: height + 10,
      decoration: BoxDecoration(
        borderRadius: BorderDirection.direction(
          topEnd: StyleManager.radius10,
          bottomEnd: StyleManager.radius10,
        ),
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: Row(
        children: [
          myIcon(
              message: StringManger.view,
              context: context,
              onPressed: () {},
              icon: Icons.remove_red_eye_outlined,
              halfHeight: true),
          line(context),
          myIcon(
              message: StringManger.print,
              context: context,
              onPressed: () {},
              icon: Icons.print_outlined),
          line(context),
          myIcon(
              message: StringManger.delete,
              context: context,
              onPressed: () {},
              icon: Icons.delete_outline_outlined),
        ],
      ));

  Widget myIcon(
          {required BuildContext context,
          required VoidCallback onPressed,
          required String message,
          bool halfHeight = false,
          required IconData icon}) =>
      IconButton(
        iconSize: 30.r,
        tooltip: message,
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
      );
  Widget text(BuildContext context, String text, String message,
          {bool thin = false}) =>
      Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
            boxShadow: StyleManager.smallShadow,
            borderRadius: StyleManager.border,
            border: Border.all(color: Theme.of(context).primaryColor),
            color: Theme.of(context).primaryColor.withOpacity(0.5)),
        child: Tooltip(
          message: message,
          child: Text(
            text,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: thin ? FontWeight.w100 : FontWeight.w900,
                ),
          ),
        ),
      );

  Widget line(BuildContext context) => SizedBox(
        height: height + 10,
        child: Dividers.verticalLine,
      );
}
