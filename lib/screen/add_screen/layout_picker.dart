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
  LayoutPicker({this.layout});

  final Layout layout;

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
              onTap: () => _pickLayoutAndNavigateBack(
                context,
                Layout.basicWithProfile,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0,),
                child: BasicWithProfileLayout(),
              ),
            ),
            GestureDetector(
              onTap: () => _pickLayoutAndNavigateBack(
                context,
                Layout.basicWithProfileAndBrand,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0,),
                child: BasicWithProfileAndBrandLayout(),
              ),
            ),
            GestureDetector(
              onTap: () => _pickLayoutAndNavigateBack(
                context,
                Layout.profileEmphasys,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0,),
                child: ProfileEmphasysLayout(),
              ),
            ),
            GestureDetector(
              onTap: () => _pickLayoutAndNavigateBack(
                context,
                Layout.brandEmphasys,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0,),
                child: BrandEmphasysLayout(),
              ),
            ),
          ],
        );
      },
      child: Consumer<LayoutPicked>(
        builder: (context, layoutPicked, child) {
          return getLayoutContainer(
            widget.layout != null ? widget.layout : layoutPicked.getLayout(),
          );
        },
      ),
    );
  }

  Widget getLayoutContainer(Layout layout) {
    switch (layout) {
      case Layout.basicWithProfile:
        return BasicWithProfileLayout();
      case Layout.basicWithProfileAndBrand:
        return BasicWithProfileAndBrandLayout();
      case Layout.profileEmphasys:
        return ProfileEmphasysLayout();
      case Layout.brandEmphasys:
        return BrandEmphasysLayout();
      default:
        return BasicWithProfileLayout();
    }
  }

  void _pickLayoutAndNavigateBack(BuildContext context, Layout layout) {
    final provider = Provider.of<LayoutPicked>(context);
    provider.setLayout(layout);
    Navigator.of(context).pop();
  }
}
