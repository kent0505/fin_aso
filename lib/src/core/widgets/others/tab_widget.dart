import 'package:flutter/material.dart';

import '../../config/fonts.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({
    super.key,
    required this.pages,
    required this.titles,
  });

  final List<Widget> pages;
  final List<String> titles;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          margin: const EdgeInsets.symmetric(horizontal: 0),
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            tabs: List.generate(
              widget.titles.length,
              (index) {
                return _Tab(
                  title: widget.titles[index],
                  isSelected: _selectedIndex == index,
                );
              },
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.pages,
          ),
        ),
      ],
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({
    required this.title,
    required this.isSelected,
  });

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 70,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xff333333),
            fontSize: 18,
            fontFamily: Fonts.w500,
          ),
        ),
      ),
    );
  }
}
