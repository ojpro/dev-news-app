import 'package:flutter/material.dart';
import 'package:news_app/core/common/components/box.dart';
import 'package:news_app/core/common/components/text.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6,),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  boxComponent(
                    child: textComponent(
                      text: 'Technology',
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                    borderRadius: 24,
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
