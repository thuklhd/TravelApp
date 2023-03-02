import 'package:flutter/material.dart';
import 'package:travel_app/core/constant/dismension_constant.dart';

class ItemBookingWidget extends StatelessWidget {
  const ItemBookingWidget(
      {Key? key,
      required this.title,
      required this.decription,
      required this.icon,
      this.onTap})
      : super(key: key);
  final String icon;
  final String title;
  final String decription;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(kItemPadding),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 20,
              height: 20,
            ),
            SizedBox(
              width: kItemPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                ),
                SizedBox(
                  height: kItemPadding / 2,
                ),
                Text(
                  decription,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
