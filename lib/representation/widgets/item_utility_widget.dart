import 'package:flutter/material.dart';

import '../../core/constant/dismension_constant.dart';
import '../../core/helpers/asset_helper.dart';
import '../../core/helpers/image_helper.dart';

class ItemUtilityHotelWidget extends StatelessWidget {
  const ItemUtilityHotelWidget({Key? key}) : super(key: key);

  static const List<Map<String, String>> listUtilityHotel = [
    {'icon': AssetHelper.wifi, 'name': 'Free\nWifi'},
    {'icon': AssetHelper.nonRefund, 'name': 'Non-\nRefundable'},
    {'icon': AssetHelper.breakfirst, 'name': 'Free-\nBreakfast'},
    {'icon': AssetHelper.nonSmoking, 'name': 'Non-\nSmoking'},
  ];

  Widget _buildItemUtilityHotelWidget({required String icon, required String name}) {
    return Column(
      children: [
        ImageHelper.loadFromAsset(
          icon,
        ),
        SizedBox(
          height: kTopPadding,
        ),
        Text(name, textAlign: TextAlign.center,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: listUtilityHotel
            .map(
              (e) => _buildItemUtilityHotelWidget(
            icon: e['icon']!,
            name: e['name']!,
          ),
        )
            .toList(),
      ),
    );
  }
}