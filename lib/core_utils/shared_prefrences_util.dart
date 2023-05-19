abstract class SharePreferenceKey {
  static const String appLang = 'appLanguage';
  static const String userId = 'userId';
  static const String userFullName = 'userName';
  static const String firstName = 'firstName';
  static const String lastName = 'lastName';
  static const String authToken = 'authToken';
  static const String refreshToken = 'refreshToken';
  static const String emailId = 'emailId';
  static const String password = 'password';
  static const String phoneNo = 'phoneNo';
  static const String photoUrl = 'photoUrl';
  static const String isLoggedIn = 'isLoggedIn';
  static const String isLoggedInWithGoogle = 'isLoggedInWithGoogle';
  static const String isLoggedInWithFacebook = 'isLoggedInWithFacebook';
  static const String currencyUsed = 'currencyUsed';
  static const String isEmailVerified = 'isEmailVerified';
  static const String isPhoneVerified = 'isPhoneVerified';
  static const String userCurrentCity = 'userCurrentCity';
  static const String dob = 'dob';
}

class SharePreferenceData {
  static final SharePreferenceData _userData = SharePreferenceData._internal();

  factory SharePreferenceData() {
    return _userData;
  }

  SharePreferenceData._internal();


}
