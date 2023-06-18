import 'package:get/get.dart';
import 'package:testetlo/core/services/show_message_service.dart';

import '../service/save_data_api.dart';

class SelectTimeController extends GetxController {
  final SaveDataApi saveDataApi = SaveDataApi();
  final RxBool hasError = false.obs;

  final RxList<String> startTime = <String>["", "", "", "", "", "", ""].obs;
  final RxList<String> endTime = <String>["", "", "", "", "", "", "", ""].obs;
  final RxInt openBoxSelected = 20.obs;
  final Map<String, int> weekDays = {
    "شنبه": 1,
    "یک شنبه": 2,
    "دوشنبه": 3,
    "سه شنبه": 4,
    "چهارشنبه": 5,
    "پنجشنبه": 6,
    "جمعه": 7,
  };
  final RxList<bool> selectDayStatus = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;
  final List<int> selectedDaysValues = [];
  String listToString(List<int> list) {
    String result = "{";
    for (int i = 0; i < list.length; i++) {
      result += list[i].toString();
      if (i < list.length - 1) {
        result += ", ";
      }
    }
    result += "}";
    return result;
  }

  Future<void> saveSelectedDays(final List<int> selectedDays) async {
    final data = listToString(selectedDays);
    try {
      await saveDataApi.postSelectedDays(selectedDays: data);

      ShowMessageService.showSuccessMsg("با موفقیت ثبت شد");
    } catch (e) {
      hasError.value = true;
    }
  }
}
