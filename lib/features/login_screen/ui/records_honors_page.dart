import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../core/services/theme_service.dart';
import '../../../core/widgets/simple_box_ui.dart';
import '../logic/controller/records_honors_controller.dart';

import '../widgets/main_item_ui_widget.dart';

class RecordHonorsPage extends StatelessWidget {
  const RecordHonorsPage({super.key});

  @override
  Widget build(final BuildContext context) =>
      GetBuilder<RecordsHonorsController>(
        init: RecordsHonorsController(),
        builder: (final controller) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SimpleBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ThemeService.lightGreen),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/add_icon.svg",
                        height: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "افزودن سابقه",
                        style: TextStyle(color: ThemeService.green),
                      )
                    ],
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.departments.length,
                  itemBuilder: (final BuildContext context, final int index) =>
                      Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: MainItemUiWidget(
                      controller: controller,
                      index: index,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
