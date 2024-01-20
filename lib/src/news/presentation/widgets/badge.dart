import 'package:flutter/material.dart';

import '../../../../core/common/components/box.dart';
import '../../../../core/common/components/text.dart';
import '../../../../core/common/styles/colors.dart';

Widget badgeComponent({
  required String text,
  bool? isSelected,
}) => boxComponent(
      height: 20,
      borderRadius: 24,
      backgroundColor: ColorsPalette.buttonBackground,
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      borderWidth: isSelected == true ? 1.0 : 0,
      borderColor: isSelected == true ? ColorsPalette.buttonTextColor : Colors.transparent,
      child: textComponent(
        text: text,
        fontSize: 14.0,
        color: ColorsPalette.buttonTextColor,
      ),
    );
