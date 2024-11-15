import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/others/svg_widget.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../blocs/navbar/navbar_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 83,
        color: Colors.white,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: BlocBuilder<NavbarBloc, NavbarState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Button(
                  id: 1,
                  active: state is NavbarInitial,
                  onPressed: () {
                    context.read<NavbarBloc>().add(ChangePageEvent(index: 0));
                  },
                ),
                _Button(
                  id: 2,
                  active: state is NavbarPiechart,
                  onPressed: () {
                    context.read<NavbarBloc>().add(ChangePageEvent(index: 1));
                  },
                ),
                _Button(
                  id: 3,
                  active: state is NavbarLesson,
                  onPressed: () {
                    context.read<NavbarBloc>().add(ChangePageEvent(index: 2));
                  },
                ),
                _Button(
                  id: 4,
                  active: state is NavbarProfile,
                  onPressed: () {
                    context.read<NavbarBloc>().add(ChangePageEvent(index: 3));
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.id,
    required this.active,
    required this.onPressed,
  });

  final int id;
  final bool active;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CuperButton(
      onPressed: onPressed,
      padding: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: active ? const Color(0xffFED600) : null,
        ),
        child: Center(
          child: SvgWidget('assets/t$id.svg'),
        ),
      ),
    );
  }
}
