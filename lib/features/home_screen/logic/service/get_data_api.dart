import 'package:testetlo/core/general_models/initial_model.dart';
import 'package:testetlo/core/network/app_network.dart';
import 'package:testetlo/core/services/endpoints.dart';
import 'package:testetlo/features/home_screen/model/department_model.dart';

class GetDataApi {
  Future<List> getDepartments() async {
    final response = await AppNetwork.getData("departments.json");
    List data = [];
    response.data.forEach((element) {
      data.add(element);
    });

    return data;
  }
}
