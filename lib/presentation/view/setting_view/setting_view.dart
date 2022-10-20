import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gate_counter/bloc/app_bloc/app_bloc.dart';
import 'package:gate_counter/bloc/style_bloc/style_bloc.dart';
import 'package:gate_counter/bloc/style_bloc/style_enums.dart';
import 'package:gate_counter/data/repositories/web_sevices.dart';
import 'package:gate_counter/presentation/resources/styles_manager.dart';
import 'package:gate_counter/presentation/shared/widget/dividers.dart';
import 'package:gate_counter/presentation/view/setting_view/widgets/database_sector.dart';
import 'package:gate_counter/presentation/view/setting_view/widgets/info_sector.dart';

import '../../resources/string_manager.dart';
import '../../shared/widget/directions.dart';
import '../../shared/widget/form_field.dart';

// ignore: must_be_immutable
class SettingsView extends StatelessWidget {
  SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.p10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DataBaseSector(),
          Dividers.h15,
          const InfoSector(),
          Dividers.h15,
          styleSector(context),
          Dividers.h15,
          hardwareSector(context),
        ],
      ),
    );
  }

  bool _activeMeterIndex = false;
  TextEditingController ssid = TextEditingController();
  TextEditingController pass = TextEditingController();
  Widget hardwareSector(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringManger.hardwareSection,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          Dividers.h5,
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: StyleManager.smallShadow,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            child: StatefulBuilder(
              builder: (context, setState) => ExpansionPanelList(
                elevation: 0.0,
                animationDuration: const Duration(seconds: 1),
                expansionCallback: (int index, bool status) {
                  setState(() {
                    _activeMeterIndex = !status;
                  });
                },
                children: [
                  ExpansionPanel(
                      canTapOnHeader: true,
                      backgroundColor: Colors.transparent,
                      isExpanded: _activeMeterIndex,
                      headerBuilder: (BuildContext context, bool isExpanded) =>
                          Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 12),
                              child: Text(
                                "  ${StringManger.config}",
                                style: Theme.of(context).textTheme.displaySmall,
                              )),
                      body: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 20.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: PaddingManager.p8,
                                  child: DefaultFormField(
                                      isTransparent: true,
                                      controller: ssid,
                                      title: StringManger.wifiName,
                                      prefix: Icons.wifi),
                                ),
                                Padding(
                                  padding: PaddingManager.p8,
                                  child: DefaultFormField(
                                    isTransparent: true,
                                    controller: pass,
                                    title: StringManger.wifiPass,
                                    prefix: Icons.password,
                                    isPass: true,
                                  ),
                                ),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .onSurface)),
                                    onPressed: () {
                                      context.read<AppBloc>().add(
                                          SendWifiCredentials(
                                              ssid.text, pass.text));
                                    },
                                    child: Text(StringManger.send))
                              ],
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      );

  Widget styleSector(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringManger.styleSector,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          Dividers.h5,
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: StyleManager.smallShadow,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: PaddingManager.p8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringManger.language,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Row(
                        children: LanguageMode.values
                            .map((e) => Padding(
                                  padding: PaddingDirection.direction(end: 8.0),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor: getColor(
                                              context,
                                              context
                                                      .read<StyleBloc>()
                                                      .languageIndex ==
                                                  e.index)),
                                      onPressed: () {
                                        context
                                            .read<StyleBloc>()
                                            .add(ChangeLanguageEvent(e));
                                      },
                                      child: Text(e.text)),
                                ))
                            .toList(),
                      )
                    ],
                  ),
                ),
                Dividers.horizontalLine,
                Padding(
                  padding: PaddingManager.p8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringManger.theme,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Row(
                        children: ThemeMode.values
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor: getColor(
                                              context,
                                              context
                                                      .read<StyleBloc>()
                                                      .themeIndex ==
                                                  e.index)),
                                      onPressed: () {
                                        context
                                            .read<StyleBloc>()
                                            .add(ChangeThemeEvent(e));
                                      },
                                      child: Text(e.text)),
                                ))
                            .toList(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  MaterialStateProperty<Color> getColor(BuildContext context, bool check) =>
      MaterialStateProperty.all(check
          ? Theme.of(context).colorScheme.onSurface
          : Theme.of(context).primaryColor.withOpacity(0.5));
}
