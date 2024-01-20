import 'package:flutter/material.dart';

import '../../../../core/common/components/box.dart';
import '../../../../core/common/components/text.dart';
import '../../../../core/common/styles/colors.dart';

Widget newsCardComponent({
  required String title,
  required String imageUrl,
  required String publishedAt,
}) => boxComponent(
      backgroundColor: ColorsPalette.buttonBackground,
      borderRadius: 8,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          boxComponent(
            width: 110,
            height: 68,
            borderRadius: 8,
            padding: const EdgeInsets.all(6),
            backgroundImage: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageUrl,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: SizedBox(
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: textComponent(
                        text:title,
                        maxLines: 3,
                        color: Colors.white,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  textComponent(
                    text: publishedAt,
                    textAlign: TextAlign.right,
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
