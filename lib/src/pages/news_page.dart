import 'package:flutter/material.dart';

import '../widgets/title_text.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: const [
        SizedBox(height: 14),
        TitleText('News'),
      ],
    );
  }
}
