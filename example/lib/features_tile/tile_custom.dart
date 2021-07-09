import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:smart_select/smart_select.dart';
import '../choices.dart' as choices;

class FeaturesTileCustom extends StatefulWidget {
  @override
  _FeaturesTileCustomState createState() => _FeaturesTileCustomState();
}

class _FeaturesTileCustomState extends State<FeaturesTileCustom> {
  String _day;
  List<String> _month;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        SmartSelect<String>.single(
          title: 'Days',
          selectedValue: _day,
          choiceItems: choices.days,
          onChange: (selected) {
            setState(() => _day = selected.value);
          },
          validation: (chosen) {
            if (chosen.isEmpty) return 'Please select one or more';
            return null;
          },
          tileBuilder: (context, state) {
            return S2Tile.fromState(
              state,
              isTwoLine: true,
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
