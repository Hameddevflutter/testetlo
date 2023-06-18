import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/department_model.dart';
import '../service/get_data_api.dart';
import '../service/save_data_api.dart';

class DepartmentController extends GetxController {
  final GetDataApi getDataApi = GetDataApi();
  final SaveDataApi saveDataApi = SaveDataApi();
  final PageController pageController = PageController();

  final RxInt currentTabIndex = 0.obs;
  final RxList<DepartmentModel> departments = <DepartmentModel>[].obs;
  final RxList<String> pageLabel =
      ['تکمیل پروفایل مشاور', 'تکمیل پروفایل مشاور', "افزودن ساعت کاری"].obs;
  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
