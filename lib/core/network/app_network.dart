// ignore_for_file: type_annotate_public_apis

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../general_models/initial_model.dart';
import '../services/endpoints.dart';
import '../services/logger_service.dart';
import '../services/show_message_service.dart';
import 'dio_client.dart';
import 'network_exceptions.dart';

class AppNetwork {
  Future<InitModel> fetchInitData(final BuildContext context) async {
    InitModel result = InitModel();
    await ApiClient()
        .getDio()
        .get(
          Endpoints.baseUrl,
        )
        .then((final value) {
      if (value.statusCode == 200) {
        debugPrint("res data => ${value.data.toString()}");
        result = InitModel.fromJson(value.data);
      } else {
        LoggerService.logger.w(value.statusMessage);
      }
      BotToast.closeAllLoading();
    });
    return result;
  }

  static Future<InitModel> getData(
    final String url, {
    final queryParameters,
    final bool hasLoading = true,
    final baseEndpoint,
  }) async {
    if (hasLoading) {
      ShowMessageService.showLoading();
    }
    InitModel result = InitModel();
    try {
      final response = await ApiClient()
          .getDio()
          .get(
            baseEndpoint != null ? baseEndpoint + url : Endpoints.baseUrl + url,
            queryParameters: queryParameters ?? {},
          )
          .catchError((final e) {
        LoggerService.logger.e(e);
        ShowMessageService.showErrorMsg(NetworkExceptions.getErrorMessage(e));
      });
      if (response.statusCode == 200) {
        debugPrint("res data => ${response.data.toString()}");
        result = InitModel.fromJson(response.data);

        BotToast.closeAllLoading();
      } else if (result.status == "error") {
        result = InitModel.fromJson(response.data);
        ShowMessageService.showErrorMsg(result.message);
      } else {
        LoggerService.logger.w(response.statusMessage);
      }
    } on Exception catch (e) {
      LoggerService.logger.e(e);
    }
    BotToast.closeAllLoading();

    return result;
  }

  static Future<InitModel> postData(
    final String url, {
    final queryParameters,
    final body,
    final bool hasLoading = true,
    final baseEndpoint,
  }) async {
    if (hasLoading) {
      ShowMessageService.showLoading();
    }
    InitModel result = InitModel();
    // String deviceID = await Utility.getSessionId();
    debugPrint(
      "KSR: ${"POST"} $url+$queryParameters",
    );

    try {
      final response = await ApiClient()
          .getDio()
          .post(
            baseEndpoint != null ? baseEndpoint + url : Endpoints.baseUrl + url,
            queryParameters: queryParameters ?? {},
            data: body,
            options: Options(
              headers: {
                // "Accept-Language": Get.locale.languageCode.toString()
                // 'credential': Parameters.credential,
                // 'device-id': deviceID,
              },
            ),
          )
          .catchError((final e) {
        LoggerService.logger.e(e);
        ShowMessageService.showErrorMsg(NetworkExceptions.getErrorMessage(e));
      });
      if (response?.statusCode != null) {
        if (response.statusCode == 201) {
          debugPrint("res data => ${response.data.toString()}");
          result = InitModel.fromJson(response.data);
          if (result.status == "error") {
            ShowMessageService.showErrorMsg(result.message);
          }
          BotToast.closeAllLoading();
        } else if (result.status == "error") {
          result = InitModel.fromJson(response.data);
          ShowMessageService.showErrorMsg(result.message);
        } else {
          BotToast.closeAllLoading();
        }
      } else {
        BotToast.closeAllLoading();
      }
    } on Exception catch (e) {
      LoggerService.logger.e(e);
      BotToast.closeAllLoading();
    }
    BotToast.closeAllLoading();
    return result;
  }

  static Future<InitModel> updateData(
    final String url, {
    final queryParameters,
    final body,
    final bool hasLoading = true,
    final Options? options,
    final baseEndpoint,
  }) async {
    if (hasLoading) {
      ShowMessageService.showLoading();
    }
    InitModel result = InitModel();
    // String deviceID = await Utility.getSessionId();
    debugPrint(
      "KSR: ${"PUT"} $url+$queryParameters",
    );

    try {
      final response = await ApiClient()
          .getDio()
          .put(
            baseEndpoint != null ? baseEndpoint + url : Endpoints.baseUrl + url,
            queryParameters: queryParameters ?? {},
            data: body,
          )
          .catchError((final e) {
        LoggerService.logger.e(e);
        ShowMessageService.showErrorMsg(NetworkExceptions.getErrorMessage(e));
      });
      if (response?.statusCode != null) {
        if (response.statusCode == 200) {
          debugPrint("res data => ${response.data.toString()}");
          result = InitModel.fromJson(response.data);
          if (result.status == "error") {
            ShowMessageService.showErrorMsg(result.message);
          }
          BotToast.closeAllLoading();
        } else if (result.status == "error") {
          result = InitModel.fromJson(response.data);
          ShowMessageService.showErrorMsg(result.message);
        } else {
          LoggerService.logger.w(response.statusMessage);
          BotToast.closeAllLoading();
        }
      } else {
        BotToast.closeAllLoading();
      }
    } on Exception catch (e) {
      LoggerService.logger.e(e);
      BotToast.closeAllLoading();
    }
    BotToast.closeAllLoading();
    return result;
  }
}
