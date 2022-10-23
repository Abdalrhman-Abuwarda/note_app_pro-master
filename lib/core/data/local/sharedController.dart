import 'package:shared_preferences/shared_preferences.dart';
import '../../models/studentModel.dart';
import 'dart:convert';

enum PrefKeys {id, full_name, email, gender, token, refresh_token ,isLoggedIn}
class SharedPrefController {
  final String user = "USER";
  SharedPrefController._();

  static final SharedPrefController _instance=SharedPrefController._();
  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  Future initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  bool isLoggedIn() {
    return _sharedPreferences.getBool(PrefKeys.isLoggedIn.name) ?? false;
  }

  Future<bool> saveData(
      {required Student student}) async {
    String userJson = jsonEncode(student.toJson());
    await _sharedPreferences.setBool(PrefKeys.isLoggedIn.name, true);
    return await _sharedPreferences.setString(user, userJson);
    await _sharedPreferences.setBool(PrefKeys.isLoggedIn.name, true);
    // await _sharedPreferences.setString(PrefKeys.email.name, student.email);
    // await _sharedPreferences.setString(PrefKeys.full_name.name, student.fullName);
    // await _sharedPreferences.setString(PrefKeys.token.name, 'Bearer ${student.token}');
    // await _sharedPreferences.setString(PrefKeys.gender.name, student.gender);
    // await _sharedPreferences.setInt(PrefKeys.id.name, student.id);
    // await _sharedPreferences.setString(PrefKeys.refresh_token.name, 'Bearer ${student.refreshToken}');
  }

  Student getUser() {
    final student = jsonDecode(_sharedPreferences.getString(user)!);

    return Student.fromJson(student) ;
  }

  Future<bool> logout()  {
    return _sharedPreferences.clear();
  }

  // String get email{
  //   return _sharedPreferences.getString("email")??'';
  // }
  // String get token => _sharedPreferences.getString(PrefKeys.token.name) ?? '';
  // String get token => _sharedPreferences.getString(getUser().token) ?? '';
}
