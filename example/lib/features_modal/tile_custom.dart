import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:smart_select/smart_select.dart';
import '../choices.dart' as choices;

class FeaturesTileCustom extends StatefulWidget {
  @override
  _FeaturesTileCustomState createState() => _FeaturesTileCustomState();
}

class _FeaturesTileCustomState extends State<FeaturesTileCustom> {
  String _car = '';
  List<String> _smartphone = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        SmartSelect<String>.single(
          title: 'Car',
          placeholder: 'Choose one',
          selectedValue: _car,
          onChange: (selected) => setState(() => _car = selected.value),
          choiceItems: S2Choice.listFrom<String, Map>(
            source: choices.cars,
            value: (index, item) => item['value'],
            title: (index, item) => item['title'],
            group: (index, item) => item['brand'],
          ),
          choiceGrouped: true,
          modalFilter: true,
          modalFilterAuto: true,
          tileBuilder: (context, state) {
            return S2Tile.fromState(
              state,
              isTwoLine: true,
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://source.unsplash.com/yeVtxxPxzbw/100x100',
                ),
              ),
            );
          },
          modalType: S2ModalType.custom,
          customModal: (context, modal, isDismissible, enableDrag) => showCupertinoModalBottomSheet(
            expand: true,
            enableDrag: enableDrag,
            isDismissible: isDismissible,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => Material(child: modal),
          ),
        ),
        SmartSelect<String>.multiple(
          title: 'Smartphones',
          placeholder: 'Choose one',
          selectedValue: _smartphone,
          onChange: (selected) {
            setState(() => _smartphone = selected.value);
          },
          choiceItems: S2Choice.listFrom<String, Map>(
            source: choices.smartphones,
            value: (index, item) => item['id'],
            title: (index, item) => item['name'],
            group: (index, item) => item['category'],
          ),
          choiceGrouped: true,
          modalFilter: true,
          choiceConfig: S2ChoiceConfig(physics: BouncingScrollPhysics()),
          tileBuilder: (context, state) {
            return S2Tile.fromState(
              state,
              isTwoLine: true,
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://source.unsplash.com/xsGxhtAsfSA/100x100',
                ),
              ),
            );
          },
          modalType: S2ModalType.custom,
          customModal: (context, modal, isDismissible, enableDrag) => showCupertinoModalBottomSheet(
            expand: true,
            enableDrag: enableDrag,
            isDismissible: isDismissible,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => Material(child: modal),
          ),
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}
