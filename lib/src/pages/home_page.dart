import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/navbar/navbar_bloc.dart';
import '../widgets/nav_bar.dart';
import 'lesson_page.dart';
import 'main_page.dart';
import 'pie_chart_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<NavbarBloc, NavbarState>(
            builder: (context, state) {
              if (state is NavbarPiechart) return const PieChartPage();

              if (state is NavbarLesson) return const LessonPage();

              if (state is NavbarProfile) return const SettingsPage();

              return const MainPage();
            },
          ),
          const NavBar(),
        ],
      ),
    );
  }
}
