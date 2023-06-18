import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/controller/department_controller.dart';
import '../widgets/back_widget_ui.dart';
import 'about_consultant_page.dart';
import 'our_team_page.dart';
import 'records_honors_page.dart';

class DepartmentPage extends StatefulWidget {
  const DepartmentPage({super.key});

  @override
  State<DepartmentPage> createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => DefaultTabController(
        length: 3,
        child: GetBuilder<DepartmentController>(
          init: DepartmentController(),
          builder: (final controller) => Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              title: Row(
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: BackWidgetUi(),
                  ),
                  Expanded(
                    child: Align(
                      child: Text(
                        controller.pageLabel[controller.currentTabIndex.value],
                      ),
                    ),
                  ),
                ],
              ),
              bottom: TabBar(
                controller: _tabController,
                onTap: controller.pageController.jumpToPage,
                tabs: const [
                  Tab(icon: Icon(Icons.person), text: "درباره مشاور"),
                  Tab(
                    icon: Icon(Icons.emoji_events_outlined),
                    text: "سوابق و افتخارات",
                  ),
                  Tab(
                    icon: Icon(Icons.groups),
                    text: "تیم ما",
                  )
                ],
              ),
            ),
            body: PageView(
              controller: controller.pageController,
              onPageChanged: (final value) {
                _tabController.animateTo(value);
              },
              children: const [
                AboutConsultantPage(),
                RecordHonorsPage(),
                OurTeamPage(),
              ],
            ),
          ),
        ),
      );
}
