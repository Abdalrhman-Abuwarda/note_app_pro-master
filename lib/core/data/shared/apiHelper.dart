import 'package:http/http.dart';

import 'apiResponce.dart';

mixin ApiHelper{
  ApiResponce get failedResponse => ApiResponce(message: 'Something went wrong!', status: false);
}
