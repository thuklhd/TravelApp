import 'package:flutter/material.dart';
import 'package:travel_app/core/constant/dismension_constant.dart';
import 'package:travel_app/core/constant/text_style_contrain.dart';

import '../../core/constant/color_constant.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.title, this.ontap})
      : super(key: key);

  final String title;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: kMediumPadding / 2),
        decoration: BoxDecoration(
          gradient: Gradients.defaultGradientBackground,
          borderRadius: BorderRadius.circular(kMediumPadding),
        ),
        child: Text(
          title,
          style: TextStyles.defaultStyle.whiteTextColor.bold,
        ),
      ),
    );
  }
}
//defaultGradientBackground
