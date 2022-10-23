import 'package:http/http.dart' as http;
class EndPoint{
  static String baseUri = 'http://demo-api.mr-dev.tech/api/';
  // static String baseUri2 = 'http://demo-api.mr-dev.tech/api/';
  static String userUri = '${baseUri}users';
   String userRegister = '${baseUri}students/auth/register';
   String userLogin = '${baseUri}students/auth/login';
   String userLogOut = '${baseUri}students/auth/logout';
   String userForgetPassword = '${baseUri}students/auth/forget-password';
   String userResetPassword = '${baseUri}students/auth/reset-password';

   String noteUri = '${baseUri}tasks';
   String getNoteUri = '${baseUri}tasks/';
}