import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testetlo/features/login_screen/logic/controller/select_time_controller.dart';

import '../../../core/services/theme_service.dart';
import '../../../core/widgets/my_button.dart';
import '../../../core/widgets/time_picker_widget.dart';
import '../widgets/select_day_ui_widget.dart';

class AboutConsultantPage extends StatelessWidget {
  const AboutConsultantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectTimeController>(
        init: SelectTimeController(),
        builder: (controller) => Stack(
              children: [
                ListView.builder(
                  itemCount: controller.weekDays.length,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => SelectDayUiWidget(
                          checkBoxValue: controller.selectDayStatus[index],
                          checkBoxOnChange: (value) {
                            controller.selectDayStatus[index] = value!;
                            if (value) {
                              controller.selectedDaysValues.add(controller
                                  .weekDays.entries
                                  .toList()[index]
                                  .value);
                            } else {
                              controller.selectedDaysValues.remove(controller
                                  .weekDays.entries
                                  .toList()[index]
                                  .value);
                            }
                          },
                          openBoxOnTap: () {
                            controller.openBoxSelected.value = index;
                          },
                          index: index,
                          selectTimeController: controller,
                          startTimePickerOnTap: () async {
                            final selectedTimeFrom = await showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return const MyTimePickerDialog();
                              },
                            );
                            controller.startTime[index] = selectedTimeFrom;
                          },
                          endTimePickerOnTap: () async {
                            final selectedTimeTo = await showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return const MyTimePickerDialog();
                              },
                            );
                            controller.endTime[index] = selectedTimeTo;
                          },
                          day: controller.weekDays.keys.toList()[index]),
                    );
                  },
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 100,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: ThemeService.shadow,
                          blurRadius: 4,
                          spreadRadius: 2)
                    ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MyButton(
                          label: "ذخیره",
                          onTap: () {
                            controller.saveSelectedDays(
                                controller.selectedDaysValues);
                          },
                        ),
                        MyButton(
                            onTap: () {},
                            label: "انصراف",
                            labelStyle: const TextStyle(color: Colors.black),
                            buttonColor: ThemeService.background),
                      ],
                    ),
                  ),
                )
              ],
            ));
  }
}
