import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gate_counter/presentation/resources/string_manager.dart';
import 'package:gate_counter/presentation/resources/styles_manager.dart';
import 'package:gate_counter/presentation/shared/widget/dividers.dart';
import 'package:gate_counter/presentation/view/records_view/widgets/record_design.dart';

import '../../../data/models/records.dart';
import '../../shared/widget/directions.dart';

class RecordsView extends StatelessWidget {
  RecordsView({Key? key}) : super(key: key);

  final List<Record> records = List.generate(
    100,
    (i) => Record(
      date: '13-6-2022 3:40 AM',
      items: [RecordItem("1", 10)],
    ),
  );

  @override
  Widget build(BuildContext context) {
    double width = getW(MediaQuery.of(context).size.width);

    return Expanded(
      child: records.isEmpty
          ? noRecords(context)
          : Padding(
              padding: PaddingManager.p10,
              child: Scrollbar(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                      padding: PaddingDirection.direction(end: 20),
                      child: RecordDesign(records[index])),
                  itemCount: records.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 500,
                      mainAxisSpacing: 10,
                      childAspectRatio: width,
                      crossAxisSpacing: 10),
                ),
              ),
            ),
    );
  }

  double getW(double width) {
    if (width < 730) {
      return 7.h;
    }
    if (width < 780) {
      return 3.5.h;
    } else if (width < 850) {
      return 4.h;
    } else if (width < 950) {
      return 4.5.h;
    } else {
      return 5.5.h;
    }
  }

  Widget noRecords(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.speaker_notes_off_outlined,
          color: Theme.of(context).colorScheme.onSurface,
          size: 150.r,
        ),
        Dividers.h10,
        Text(StringManger.noRecords,
            style: Theme.of(context).textTheme.displayLarge!),
      ],
    );
  }
}
