import 'package:flutter/material.dart';
import 'package:travel_app/core/constant/dismension_constant.dart';
import 'package:travel_app/core/extenstion/date_ext.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/screens/guest_and_room_screen.dart';
import 'package:travel_app/representation/screens/hotel_screen.dart';
import 'package:travel_app/representation/screens/select_date_screen.dart';
import 'package:travel_app/representation/widgets/appbar_container.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';

import '../widgets/item_booking_widget.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({Key? key, this.destination}) : super(key: key);
  static const String routeName = "/hotel_booking_screen";
  final String? destination;

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? selectDate = '';
  String? guestAndRoom;

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      implemtLeading: true,
      titleString: "Home Booking",
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemBookingWidget(
              icon: AssetHelper.location,
              title: "Destination",
              decription: "South Korea",
              onTap: () {},
            ),
            SizedBox(
              height: kMediumPadding / 1.5,
            ),
            StatefulBuilder(
              builder: (context, setState) {
                return ItemBookingWidget(
                  icon: AssetHelper.calender,
                  title: "Select Date",
                  decription: selectDate ?? '13 Feb - 18 Feb 2021',
                  onTap: () async {
                    final result = await Navigator.of(context)
                        .pushNamed(SelectDateScreen.routeName);
                    if (!(result as List<DateTime?>)
                        .any((element) => element == null)) {
                      selectDate =
                          '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                      setState(() {});
                    }
                  },
                );
              },
            ),
            SizedBox(
              height: kMediumPadding / 1.5,
            ),
            ItemBookingWidget(
              icon: AssetHelper.caricon,
              title: 'Guest and Room',
              decription: guestAndRoom ?? 'Guest and room',
              onTap: () async {
                final result = await Navigator.of(context)
                    .pushNamed(GuestAndRoomBookingScreen.routeName);
                if (result is List<int>) {
                  setState(() {
                    guestAndRoom = '${result[0]} Guest, ${result[1]} Room';
                  });
                }
              },
            ),
            SizedBox(
              height: kMediumPadding / 1.5,
            ),
            ButtonWidget(
              title: "sreach",
              ontap: () {
                Navigator.of(context).pushNamed(HotelScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
