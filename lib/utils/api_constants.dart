class ApiConstants {
  static const appKey =
      'caeb1afaaeb9598a22a17d27ad3120a9754b5170b253b81da576404212052441';
//  static const baseUrl = 'http://192.168.1.11:1020/api/';
  static const baseUrl = 'http://192.168.43.40:1020/api/';
  static const apiHeaders = {'app_key': appKey};

  // Api End Points
  static const getFamilyVehicleDetails = 'common/getFamilyOrVehicleDetails';
  static const searchFamilyVehicle = 'common/searchFamilyOrVehicle';
  static const saveFamilyVehicle = 'tracking/guestFamilyVehicle';
  static const saveGift = 'admin/saveGift';
  static const getParkingAllotment = 'common/getCommonMaster';
  static const getReports = 'reports/familyWise';
  static const getViewReports = 'viewcallforvehicle';
  // Gate Input Constants
  static const gateType1 = 'gate_1';
  static const gateType2 = 'gate_2';
  static const gateType3 = 'gate_3';
  static const gift = 'gift';
  static const parking = 'PARKING';
  static const redirect = "";
  static const masterInputParkingStatus = 'parking_status';
  static const masterInputParkingAllotment = 'parking_allotment';
  // Screen Input Constants
  static const screenInputTypeDrop = 'drop';
  static const screenInputTypePickup = 'pickup';
  static const screenInputTypeVehicle = 'vehicle';
  // App Type
  static const appType = 'mobile';

  // Status
  static const call = 'call';
  static const statusPickup = 'PICKUP';
  static const statusCallForVehicle = 'CALLFORVEHICLE';
  static const statusParkingIn = 'Parking_in';
  static const statusParkingOut = 'parking_out';


  static var screenInputTypeGuest = 'guest assistance';
  static const buttonStatusIn= 'PICKUP';
  static const buttonStatusOut= 'outforparking';

  static const guestIdDefault = 0;

  // Invitation Types
  static const invitationTypePlanned = 'planned';
  static const invitationTypeUnplanned = 'unplanned';
}
