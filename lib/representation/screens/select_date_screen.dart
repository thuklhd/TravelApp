import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel_app/core/constant/dismension_constant.dart';
import 'package:travel_app/representation/widgets/appbar_container.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';

import '../../core/constant/color_constant.dart';

class SelectDateScreen extends StatelessWidget {
  SelectDateScreen({Key? key}) : super(key: key);
  static const routeName = "select_date_screen";
  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
        titleString: "Select date",
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding,
            ),
            SfDateRangePicker(
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.range,
              monthViewSettings:
                  const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
              selectionColor: ColorPalette.yellowColor,
              startRangeSelectionColor: ColorPalette.yellowColor,
              endRangeSelectionColor: ColorPalette.yellowColor,
              rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
              todayHighlightColor: ColorPalette.yellowColor,
              toggleDaySelection: true,
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                if (args.value is PickerDateRange) {
                  rangeStartDate = args.value.startDate;
                  rangeEndDate = args.value.endDate;
                } else {
                  rangeStartDate = null;
                  rangeEndDate = null;
                }
              },
            ),
            ButtonWidget(
              title: "Select",
              ontap: () {
                Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
              },
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            ButtonWidget(
              title: "Cancel",
              ontap: () {
                Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
              },
            ),
          ],
        ));
  }
}
