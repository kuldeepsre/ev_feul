import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {
  static Widget verticalDivider = const VerticalDivider(thickness: 2,);
  Constants._();
  static var staticDashBloc;
  static bool isTabularView = true;
  static String user_token = "";
  static String userId = "";

  //static const IP = "192.168.1.11";
 static const IP = "192.168.43.40";
  static const BASE_URL = "http://${IP}:1020/api/";
  static const BASE_URL_IMAGE = "http://${IP}:1020/";
  static const LOGIN_API_URL = BASE_URL + "login";
  static const LOGOUT_API_URL = BASE_URL + "common/userLogout";//{username}
  static const USER_LIST_API_URL = BASE_URL + "User/getUserList";
  static String POST_GET_PARKING_DATA=BASE_URL+"common/getparking";
  static const USER_CREATE_API_URL = BASE_URL + "User/createUser";
  static const PRODUCT_DETAILS_API_URL = BASE_URL + "InventoryProduct/getProducts/";//productId
  static const PRODUCT_UPLOAD_DATA_API_URL = BASE_URL + "InventoryProduct/postProducts";//productId
  static const FILE_UPLOAD_DATA_API_URL = BASE_URL + "File/uploadFile";//productId
  static const IMAGE_ENCODED_STRING_DATA_API_URL = BASE_URL + "File/getImageEncodedString";//productId
  static String POST_SAVE_GUEST_DATA_API_URL=BASE_URL+"admin/saveGuest";
  static String POST_SAVE_TRACKING_DATA_API_URL=BASE_URL+"tracking/guestFamilyVehicle";
  static String POST_EVENTList_DATA_API_URL=BASE_URL+"common/getEventList";
  static String POST_SearchDATA_API_URL=BASE_URL+"common/getFamilyOrVehicleDetails";
  static String POST_COMMON_EVENT_DATA_API_URL=BASE_URL+"common/getEventList";
  static String POST_COMMON_AUTO_DATA_API_URL=BASE_URL+"common/searchFamilyOrVehicle";
  static String POST_PARKING_DATA=BASE_URL+"common/getCommonMaster";
  static String POST_REPORT_DATA=BASE_URL+"reports/familyWise";
  //Save Gatewise Data
  static String POST_SAVE_GIFY_GUEST_DATA_API_URL=BASE_URL+"saveGateWiseGuestData";
  static String POST_aveGift_DATA_API_URL=BASE_URL+"admin/saveGift";
  static  String POST_EVENT=BASE_URL+"admin/saveEventMaster";
  static String GETFCNA_APPROVAL_DATA_API =
      BASE_URL + "FcnaUnderManagment/GetFcnaManagementApprovalPendingData/";
  static String POST_FCNAMANAGEMENT_STATUS_API =
      BASE_URL + "FcnaUnderManagment/updateFcnaManagementStatus/";
  static Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    'Content-Type': 'application/json; charset=UTF-8',
    'connection': 'keep-alive',
    "app_key": "caeb1afaaeb9598a22a17d27ad3120a9754b5170b253b81da576404212052441",
    "token": user_token
  };
}
