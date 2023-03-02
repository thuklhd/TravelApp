import 'package:flutter/material.dart';
import 'package:travel_app/core/constant/dismension_constant.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

class ItemAddGuestAndRoom extends StatefulWidget {
  ItemAddGuestAndRoom(
      {Key? key, required this.icon, required this.title, this.initdata = 0})
      : super(key: key);
  final String icon;
  final String title;
  final int initdata;

  @override
  State<ItemAddGuestAndRoom> createState() => ItemAddGuestAndRoomState();
}

class ItemAddGuestAndRoomState extends State<ItemAddGuestAndRoom> {
  late final TextEditingController _textEditingController;
  final FocusNode _focusNode = FocusNode();
  late int number;

  @override
  void initState() {
    super.initState();
    _textEditingController =
        TextEditingController(text: widget.initdata.toString())
          ..addListener(() {
            number = int.parse(_textEditingController.text);
          });
    number = widget.initdata;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kTopPadding),
          color: Colors.white),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      padding: EdgeInsets.all(kMediumPadding),
      child: Row(
        children: [
          ImageHelper.loadFromAsset(widget.icon),
          SizedBox(
            width: kDefaultPadding,
          ),
          Text(widget.title),
          Spacer(),
          GestureDetector(
            onTap: () {
              if (number > 1) {
                setState(() {
                  number--;
                });
              }
              _textEditingController.text = number.toString();
              if (_focusNode.hasFocus) {
                _focusNode.unfocus();
              }
            },
            child: ImageHelper.loadFromAsset(AssetHelper.minus),
          ),
          Container(
            height: 35,
            width: 60,
            padding: EdgeInsets.only(left: 3),
            alignment: Alignment.center,
            child: TextField(
              controller: _textEditingController,
              textAlign: TextAlign.center,
              focusNode: _focusNode,
              enabled: true,
              autocorrect: false,
              minLines: 1,
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  bottom: 18,
                ),
              ),
              onChanged: (value) {},
              onSubmitted: (String submitValue) {},
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                number++;
              });

              _textEditingController.text = number.toString();
              if (_focusNode.hasFocus) {
                _focusNode.unfocus();
              }
            },
            child: ImageHelper.loadFromAsset(AssetHelper.plus),
          ),
        ],
      ),
    );
  }
}
