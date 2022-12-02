import 'package:dio/dio.dart';

import 'custom_dialog.dart';
import 'navigation_service.dart';
import 'strings.dart';

class CustomException implements Exception {
  late String msg;

  CustomException({required this.msg});

  CustomException.fromDioError(DioError e) {
    switch (e.type) {
      case DioErrorType.cancel:
        msg = Strings.requestCancelled;
        break;
      case DioErrorType.connectTimeout:
        msg = Strings.connectionTimeout;
        break;
      case DioErrorType.receiveTimeout:
        msg = Strings.connectionTimeout;
        break;
      case DioErrorType.sendTimeout:
        msg = Strings.connectionTimeout;
        break;
      case DioErrorType.other:
        msg = Strings.noInternetConnection;
        break;
      case DioErrorType.response:
        _handleResponseError(e.response?.statusCode);
        break;
      default:
        msg = Strings.somethingWentWrong;
        break;
    }
  }

  _handleResponseError(int? code) {
    switch (code) {
      case 400:
        // Bad Request
        msg = Strings.badRequest;
        break;
      case 401:
        // Un Authorized
        msg = Strings.unAuthorized;
        break;
      case 402:
        // Un Authorized
        msg = Strings.unAuthorized;
        break;
      case 403:
        // Forbidden
        msg = Strings.forbiddenError;
        break;
      case 404:
        // Not Found
        msg = Strings.apiNotFound;
        break;
      case 500:
        // Internal Server Error
        msg = Strings.serverError;
        break;
      default:
        msg = Strings.somethingWentWrong;
        break;
    }

    CustomDialogs.showDialogRedirctLogin(
        NavigationService().navigationKey.currentContext!,
        'Token has been expired!',
        'Token Expired');
  }
}
