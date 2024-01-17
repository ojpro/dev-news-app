import 'package:flutter/material.dart';
import 'package:news_app/core/common/components/icon.dart';
import 'package:news_app/core/common/layouts/basic_layout.dart';
import 'package:news_app/src/news/presentation/pages/news_page.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BasicLayout(
        title: 'News App',
        actions: [
          IconButton(
            onPressed: null,
            icon: iconComponent(
              icon: Icons.settings_rounded,
            ),
          )
        ],
        child: const NewsPage(),
      ),
    );
  }
}
