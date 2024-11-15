import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({
    super.key,
    this.expanded = true,
  });

  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No data'),
    );
  }
}
