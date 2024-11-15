import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/others/svg_widget.dart';

class SheetWidget extends StatelessWidget {
  const SheetWidget({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 106),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Stack(
        children: [
          body,
          Positioned(
            top: 10,
            right: 15,
            child: CuperButton(
              onPressed: () {
                context.pop();
              },
              child: const SvgWidget('assets/close.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
