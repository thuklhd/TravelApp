import 'package:flutter/material.dart';
import 'package:travel_app/core/constant/dismension_constant.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/widgets/appbar_container.dart';

import '../widgets/button_widget.dart';
import '../widgets/item_add_guest_and_room.dart';

class GuestAndRoomBookingScreen extends StatefulWidget {
  const GuestAndRoomBookingScreen({Key? key}) : super(key: key);
  static final String routeName = "/guest_and_room_screen";

  @override
  State<GuestAndRoomBookingScreen> createState() =>
      _GuestAndRoomBookingScreenState();
}

class _GuestAndRoomBookingScreenState extends State<GuestAndRoomBookingScreen> {
  final GlobalKey<ItemAddGuestAndRoomState> _itemCountGuest =
      GlobalKey<ItemAddGuestAndRoomState>();
  final GlobalKey<ItemAddGuestAndRoomState> _itemCountRoom =
      GlobalKey<ItemAddGuestAndRoomState>();

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
        titleString: "Add Guest And Room",
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemAddGuestAndRoom(
              key: _itemCountGuest,
              icon: AssetHelper.peoples,
              initdata: 2,
              title: "Guest",
            ),
            ItemAddGuestAndRoom(
              key: _itemCountRoom,
              icon: AssetHelper.redcar,
              initdata: 1,
              title: "Room",
            ),
            ButtonWidget(
              title: "done",
              ontap: () {
                Navigator.of(context).pop([
                  _itemCountGuest.currentState!.number,
                  _itemCountRoom.currentState!.number,
                ]);
              },
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
          ],
        ));
  }
}
