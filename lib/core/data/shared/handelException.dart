
import 'package:http/http.dart' as http;

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String message)
      : super(message, "No Internet conection ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException(String message) : super(message, "Invalid Input: ");
}

class UnauthenticatedException extends AppException{
  UnauthenticatedException(String message) : super(message, "Your account login in anther device");
}


void returnResponse(http.Response response) {
  switch (response.statusCode) {
  // case 200:
  // case 201:
  //   var responseJson = json.decode(response.body.toString());
  //   print(responseJson);
  //   return responseJson;
  //   case 400:
  //     BadRequestException(response.body.toString());
  //     break;
    case 403:
      throw UnauthorisedException(response.body.toString());
      break;
    case 500:
    default:
      FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
  print("break");
}






//
// class NoInternetException {
//   String message;
//   NoInternetException(this.message);
// }
//
// class NoServiceFoundException {
//   String message;
//   NoServiceFoundException(this.message);
// }
//
// class InvalidFormatException {
//   String message;
//   InvalidFormatException(this.message);
// }
//
// class UnknownException {
//   String message;
//   UnknownException(this.message);
// }