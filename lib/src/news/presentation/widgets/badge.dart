import 'package:flutter/material.dart';

import '../../../../core/common/components/box.dart';
import '../../../../core/common/components/text.dart';
import '../../../../core/common/styles/colors.dart';

Widget badgeComponent({
  required String text
}) => boxComponent(
      height: 20,
      child: textComponent(
        text: text,
        fontSize: 14.0,
        color: ColorsPalette.buttonTextColor,
      ),
      borderRadius: 24,
      backgroundColor: ColorsPalette.buttonBackground,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    );
