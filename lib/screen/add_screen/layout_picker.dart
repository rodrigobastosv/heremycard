import 'package:flutter/material.dart';
import 'package:heremycard/components/layout/basic_with_profile_and_brand_layout.dart';
import 'package:heremycard/components/layout/basic_with_profile_layout.dart';
import 'package:heremycard/components/layout/brand_emphasys_layout.dart';
import 'package:heremycard/components/layout/profile_emphasys_layout.dart';
import 'package:heremycard/enum/layout.dart';
import 'package:heremycard/utils/mc_ui_utils.dart';
import 'package:provider/provider.dart';

import 'layout_picked.dart';

class LayoutPicker extends StatefulWidget {
  @override
  _LayoutPickerState createState() => _LayoutPickerState();
}

class _LayoutPickerState extends State<LayoutPicker> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        MCUiUtils.showSimpleDialog(
          title: Text('Pick your layout:'),
          context: context,
          children: <Widget>[
            GestureDetector(
            onTap: () =>_pickLayoutAndNavigateBack(context, Layout.basicWithProfile),
              child: BasicWithProfileLayout(),
            ),
            GestureDetector(
              onTap: () =>_pickLayoutAndNavigateBack(context, Layout.basicWithProfileAndBrand),
              child: BasicWithProfileAndBrandLayout(),
            ),
            GestureDetector(
              onTap: () =>_pickLayoutAndNavigateBack(context, Layout.profileEmphasys),
              child: ProfileEmphasysLayout(),
            ),
            GestureDetector(
              onTap: () =>_pickLayoutAndNavigateBack(context, Layout.brandEmphasys),
              child: BrandEmphasysLayout(),
            ),
          ],
        );
      },
      child: Consumer<LayoutPicked>(
        builder: (context, layoutPicked, child) {
          switch(layoutPicked.getLayout()) {
            case Layout.basicWithProfile:
              return Container(
                width: 300.0,
                height: 150.0,
                child: BasicWithProfileLayout(),
              );
            case Layout.basicWithProfileAndBrand:
              return Container(
                width: 300.0,
                height: 150.0,
                child: BasicWithProfileAndBrandLayout(),
              );
            case Layout.profileEmphasys:
              return Container(
                width: 300.0,
                height: 150.0,
                child: ProfileEmphasysLayout(),
              );
            case Layout.brandEmphasys:
              return Container(
                width: 300.0,
                height: 150.0,
                child: BrandEmphasysLayout(),
              );
            default:
              return Text('Choose bitch!');
          }
        },
      ),
    );
  }

  void _pickLayoutAndNavigateBack(BuildContext context, Layout layout) {
    final provider = Provider.of<LayoutPicked>(context);
    provider.setLayout(layout);
    Navigator.of(context).pop();
  }
}
