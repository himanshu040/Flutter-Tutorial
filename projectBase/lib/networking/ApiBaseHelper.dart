import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/Strings.dart';
import '../constants/UrlEndPoints.dart';
import '../utility/Util.dart';
import 'CustomException.dart';

class ApiBaseHelper {
  Map<String, String> header(String timestamp, String signature) {
    Map<String, String> map = {
      "Accept": "application/json",
      "accept-language": Util.currentLocal,
      "content-type": "application/json",
      "Signature": signature,
      "timestamp": timestamp
    };
    return map;
  }

  Map<String, String> headerwithToken(String token) {
    Map<String, String> map = {
      "Authorization": "Bearer $token",
      "Accept": "application/json",
      "content-type": "application/json",
    };
    return map;
  }

  Map<String, String> map = {
    "Accept": "application/json",
    "content-type": "application/json",
  };

  // Future<dynamic> get(String url) async {
  //   var responseJson;
  //   try {
  //     final response =
  //         await http.get(Uri.parse(BASE_URL + BASE_URL_NCFADMIN + url));
  //     responseJson = _returnResponse(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }

  /* Future<dynamic> getGames(String depid) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(ApiBaseHelper.GAMES_BASE_URL +
          "activity/allactivitybytype?baseoption=" +
          depid));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
*/
  // Future<dynamic> post(
  //     String url, Map<String, String> header, Map jsObject) async {
  //   var responseJson;
  //   try {
  //     final response = await http.post(
  //         Uri.parse(BASE_URL + BASE_URL_NCFADMIN + url),
  //         headers: header,
  //         body: json.encode(jsObject));
  //     responseJson = _returnResponse(response);
  //   } on Exception catch (_) {
  //     print('never reached');
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }

  Future<dynamic> postWithoutHeader(String url, Map jsObject) async {
    var responseJson;
    try {

      final response = await http.post(
        Uri.parse(url),
        headers: map,
        body: json.encode(jsObject),
      );
      responseJson = _returnResponse(response);
    } catch (e) {
    //  print('never reached');
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postWithoutHeaderAndBody(String url) async {
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
      );
      responseJson = _returnResponse(response);
    } catch (e) {
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postEncrypt(String url, Map jsObject) async {
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: map,
        body: json.encode(jsObject),
      );
      responseJson = _returnResponse(response);
    } catch (e) {
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postwithToken(String url, Map jsObject, String token) async {
    var responseJson;
    try {
      // print("url: BASE_URL + BASE_URL_NCERTSERVICE +$url");
      final responsew = await http.post(
        Uri.parse(url),
        headers: headerwithToken(token),
        body: json.encode(jsObject),
      );
      responseJson = _returnResponse(responsew);
    } on Exception catch (_) {
      // print(responseJson);
      responseJson = _returnResponse(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postwithTokenWithoutBody(String url, String token) async {
    var responseJson;
    try {
      // print("url: BASE_URL + BASE_URL_NCERTSERVICE +$url");
      final responsew = await http.post(
        Uri.parse(url),
        headers: headerwithToken(token),
      );
      responseJson = _returnResponse(responsew);
    } on Exception catch (_) {
      // print(responseJson);
      responseJson = _returnResponse(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postImage(
      String url, Map<String, String> header, Map jsObject) async {
    var responseJson;
    try {
      final response = await http.post(
          Uri.parse(BASE_URL + "local/api/picture-update.php"),
          headers: header,
          body: json.encode(jsObject));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postlogin(
      String url, Map<String, String> header, Map jsObject) async {
    var responseJson;
    try {
      final response = await http.post(Uri.parse(BASE_URL + url),
          headers: header, body: json.encode(jsObject));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        //  print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        //var responseJson = json.decode(response.body.toString());
        var responseJson = json.decode(response.body.toString());
        // print(responseJson);
        return responseJson;
      case 403:
        var responseJson =
            json.decode('{"errors":[{"code": "NP00REFRESH","message": ""}]}');
        // print(responseJson);
        return responseJson;
      case 404:
        var responseJson = json.decode(
            '{"errors":[{"code": "NP00REFRESH","message": "Error Code: 404"}]}');
        // print(responseJson);
        return responseJson;
      case 503:
        var responseJson =
            json.decode('{"errors":[{"code": "NP00REFRESH","message": ""}]}');
        // print(responseJson);
        return responseJson;
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

Future<String> getLanguageCode() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String code = _prefs.getString(prefSelectedLanguageCode)!;
  String headercode = "";
  if (code == "en")
    return "en";
  else if (code == "gu")
    return "guj";
  else if (code == "as")
    return "asm";
  else if (code == "bo")
    return "bod";
  // else if (code == "doi")
  //   return "doi";
  else if (code == "ks")
    return "ks";
  else if (code == "kn")
    return "kan";
  else if (code == "mr")
    return "mar";
  else if (code == "ml")
    return "mal";
  else if (code == "pa")
    return "pan";
  else if (code == "te")
    return "tel";
  else
    return "hin";
}

class Resource<T> {
  final String url;
  T Function(Response response) parse;

  Resource({required this.url, required this.parse});
}
