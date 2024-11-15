import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_svg.dart';
import 'cup_button.dart';
import '../blocs/navbar/navbar_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
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
                _Button(id: 1, current: state is NavbarInitial),
                _Button(id: 2, current: state is NavbarPiechart),
                _Button(id: 3, current: state is NavbarLesson),
                _Button(id: 4, current: state is NavbarProfile),
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
    required this.current,
  });

  final int id;
  final bool current;

  @override
  Widget build(BuildContext context) {
    return CupButton(
      onPressed: current
          ? null
          : () {
              context.read<NavbarBloc>().add(ChangePage(index: id));
            },
      padding: 0,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: current ? const Color(0xffFED600) : null,
        ),
        child: Center(
          child: MySvg('assets/t$id.svg'),
        ),
      ),
    );
  }
}
