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
  static const BASE_URL = "http://evfuel.afmerp.com/api/";


  static const BASE_URL_IMAGE = "http://${IP}:1020/";
  static const LOGIN_API_URL = BASE_URL + "login";
  static const POST_SUBSCRIPTIONS_DATA = BASE_URL + "subscription-list";
  static const POST_SUBSCRIPTIONS_ADD_DATA = BASE_URL + "subscription-add";
  static const POST_PLAN_LIST = BASE_URL + "plan-list";

  static const POST_NEAR_LIST_DATA = BASE_URL + "nearest-swapstation";
  static Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    'Content-Type': 'application/json; charset=UTF-8',
    'connection': 'keep-alive',


  };
}
