
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static String userId = 'USERKEY';
  static String usernameKey = 'USERNAMEKEY';
  static String userMailKey = 'USERMAILKEY';
  static String userWalletKey = 'USERWALLETKEY';
  static String userProfileKey = 'USERPROFILEKEY';

  // for saving the user data in local memory
  Future <bool> saveUserId(String getUserId)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userId, getUserId);
  }
  Future <bool> saveUserName(String getUserName)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(usernameKey, getUserName);
  }
  Future <bool> saveUserMail(String getUserMail)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userMailKey, getUserMail);
  }
  Future <bool> saveUserWallet(String getUserWallet)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userWalletKey, getUserWallet);
  }
  Future <bool> saveUserProfilePic(String savaUserProfile)async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userProfileKey, savaUserProfile);
  }
  // For getting the user data from the local memory
  Future<String?> getUserId()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userId);
  }
  Future<String?> getUserName()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(usernameKey);
  }
  Future<String?> getUserMail()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userMailKey);
  }
  Future<String?> getUserWallet()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userWalletKey);
  }
  Future<String?> getUserProfilePic()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userProfileKey);
  }
}