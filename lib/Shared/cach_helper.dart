
import 'package:shared_preferences/shared_preferences.dart';

class CaChHelper{

  static late SharedPreferences sharedPreferences;

  static init()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

 static Future<bool> putData({
  required String key,
  required bool value,
})async{
    return await sharedPreferences.setBool(key, value);
}

  static dynamic getData({
    required dynamic key,
  }){
    return  sharedPreferences.get(key);
  }
   static dynamic save ;
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  })async{
  if(value is String)  return await sharedPreferences.setString(key, value);
  if(value is int)  return await sharedPreferences.setInt(key, value);
  if(value is bool)  return await sharedPreferences.setBool(key, value);
  if(value is double) return await sharedPreferences.setDouble(key, value);

  return save ;
  }

}