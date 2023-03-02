import 'package:flutter/material.dart';
import 'package:travel_app/core/constant/color_constant.dart';
import 'package:travel_app/core/constant/dismension_constant.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/data/model/hotel_model.dart';
import 'package:travel_app/representation/screens/hotel_detail.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';

import 'dashline_widget.dart';

class ItemHotelWidget extends StatelessWidget {
  const ItemHotelWidget({Key? key, required this.hotelModel}) : super(key: key);
  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(right: kDefaultPadding),
            child: ImageHelper.loadFromAsset(
              hotelModel.hotelImage,
              radius: BorderRadius.only(
                topLeft: Radius.circular(
                  kDefaultPadding,
                ),
                bottomRight: Radius.circular(kDefaultPadding),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelModel.hotelName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(AssetHelper.location),
                    SizedBox(
                      width: kMediumPadding,
                    ),
                    Text(hotelModel.location),
                    Expanded(
                      child: Text(
                        '-${hotelModel.awayKilometer} from destination',
                        style: TextStyle(color: ColorPalette.subTitleColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(AssetHelper.iconstar),
                    SizedBox(
                      width: kMediumPadding,
                    ),
                    Text(hotelModel.star.toString()),
                    Text(
                      '-${hotelModel.numberOfReview} review',
                      style: TextStyle(color: ColorPalette.subTitleColor),
                    ),
                  ],
                )
              ],
            ),
          ),
          DashLineWidget(),
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$${hotelModel.price}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: kMediumPadding,
                      ),
                      Text(
                        '\nnight',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ButtonWidget(
                    title: 'book a room',
                    ontap: () {
                      Navigator.of(context).pushNamed(
                          DetailHotelScreen.routeName,
                          arguments: hotelModel);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
