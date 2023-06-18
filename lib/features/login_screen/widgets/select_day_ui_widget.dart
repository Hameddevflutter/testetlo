// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/theme_service.dart';
import '../../../core/widgets/simple_box_ui.dart';
import '../logic/controller/select_time_controller.dart';
import 'time_widget.ui.dart';

class SelectDayUiWidget extends StatelessWidget {
  const SelectDayUiWidget({
    required this.startTimePickerOnTap,
    required this.endTimePickerOnTap,
    required this.selectTimeController,
    required this.day,
    required this.index,
    required this.openBoxOnTap,
    required this.checkBoxValue,
    required this.checkBoxOnChange,
    super.key,
  });
  final Function() startTimePickerOnTap;
  final Function() endTimePickerOnTap;
  final Function() openBoxOnTap;
  final SelectTimeController selectTimeController;
  final int index;
  final String day;
  final bool checkBoxValue;
  final Function(bool?) checkBoxOnChange;

  @override
  Widget build(final BuildContext context) => Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: selectTimeController.selectDayStatus[index] ? 230 : 55,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ThemeService.borderColor, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              physics: !selectTimeController.selectDayStatus[index]
                  ? const NeverScrollableScrollPhysics()
                  : const ClampingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: checkBoxValue,
                        onChanged: checkBoxOnChange,
                      ),
                      Text(day),
                      const Spacer(),
                      Text(
                        "باز است",
                        style: TextStyle(color: ThemeService.lightGray),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("از ساعت"),
                          TimeWidgetUi(
                            onTap: startTimePickerOnTap,
                            timeValue: selectTimeController.startTime[index],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("تا ساعت"),
                          TimeWidgetUi(
                            onTap: endTimePickerOnTap,
                            timeValue: selectTimeController.endTime[index],
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: openBoxOnTap,
                    child: SimpleBox(
                      content: Text(
                        "۲۴ ساعت باز است",
                        style: TextStyle(
                          color: selectTimeController.openBoxSelected.value ==
                                  index
                              ? ThemeService.green
                              : ThemeService.lightGray,
                          fontSize: 16,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: selectTimeController.openBoxSelected.value ==
                                  index
                              ? ThemeService.green
                              : ThemeService.borderColor,
                        ),
                        color:
                            selectTimeController.openBoxSelected.value == index
                                ? ThemeService.lightGreen
                                : Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
