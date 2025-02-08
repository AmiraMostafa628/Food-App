import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/features/my_orders/view/history_tab_body.dart';
import 'package:food_app/features/my_orders/view/ongoing_tab_body.dart';

class TabBarSection extends StatefulWidget {
  const TabBarSection({super.key});

  @override
  State<TabBarSection> createState() => _TabBarSectionState();
}

class _TabBarSectionState extends State<TabBarSection>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: ColorManager.primaryColor,
          unselectedLabelColor: const Color(0xFFA5A7B9),
          labelColor: ColorManager.primaryColor,
          tabs: const [
            Tab(
              text: 'Ongoing',
            ),
            Tab(
              text: 'History',
            )
          ],
        ),
        Expanded(
          child: TabBarView(
              controller: _tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: OngoingTabBody(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: HistoryTabBody(),
                ),
          ]),
        ),
      ],
    );
  }
}


