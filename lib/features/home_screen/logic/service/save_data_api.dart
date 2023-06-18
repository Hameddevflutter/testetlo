import 'package:testetlo/core/general_models/initial_model.dart';
import 'package:testetlo/core/network/app_network.dart';
import 'package:testetlo/core/services/endpoints.dart';

class SaveDataApi {
  Future<InitModel> postSelectedDays({required String selectedDays}) async {
    final body = {'selected_day': selectedDays};
    const String url = 'save_data.php';
    final response = await AppNetwork.postData(url, body: body);
    return response;
  }
}
