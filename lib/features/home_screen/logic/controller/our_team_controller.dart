import 'package:get/get.dart';

import '../../model/department_model.dart';
import '../service/get_data_api.dart';

class OurTeamController extends GetxController {
  final GetDataApi getDataApi = GetDataApi();
  final RxList<DepartmentModel> departments = <DepartmentModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchDepartments();
  }

  Future<void> fetchDepartments() async {
    final response = await getDataApi.getDepartments();
    final List<dynamic> jsonList = response;
    final List<DepartmentModel> departmentList =
        jsonList.map((json) => DepartmentModel.fromJson(json)).toList();
    departments.value = departmentList;
  }
}
