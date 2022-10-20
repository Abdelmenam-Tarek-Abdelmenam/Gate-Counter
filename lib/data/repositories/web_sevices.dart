import 'package:dio/dio.dart';

const _base = "https://script.google.com/macros/s/";

const _stableBase =
    "AKfycbw0velOfw9bhtoK1cBaKzN1Ph5c-A6urNqmB4_ciW2izKNhL_Weq8MRI2Mv3LSnS4wYFQ";

const _funcSheetLinkBase = "$_base$_stableBase/exec?";

class WebServices {
  final Dio _dio = Dio();

  Future<bool> sendCredentialsToEsp(
      String wifiName, String wifiPassword) async {
    wifiPassword = _prepareCredentials(wifiPassword);
    wifiName = _prepareCredentials(wifiName);

    String url = 'http://192.168.4.1/?'
        'ssid=$wifiName&pass=$wifiPassword';
    try {
      print(url);
      String response = await _doRequest(url);
      print(response);
      if (response.trim() != "Failed") {
        return true;
      } else {
        return false;
      }
    } catch (_) {
      return false;
    }
  }

  String buildUrl(String mode) {
    return "${_funcSheetLinkBase}mode=$mode";
  }

  Future<dynamic> _doRequest(String url) async {
    try {
      Response response = await _dio.get(url);
      return response.data;
    } on DioError catch (e) {
      throw DioErrors.fromCode(e);
    } catch (e) {
      throw const DioErrors();
    }
  }

  String _prepareCredentials(String old) {
    Map<String, dynamic> changedData = {
      "#": "%23",
      "&": "%26",
      "\$": "%24",
      " ": "%20"
    };
    changedData.forEach((key, value) {
      old = old.replaceAll(key, value);
    });

    return old;
  }
}

class DioErrors implements Exception {
  const DioErrors([
    this.message = 'An unknown exception occurred.',
  ]);

  factory DioErrors.fromCode(DioError error) {
    String message;
    switch (error.type) {
      case DioErrorType.connectTimeout:
        message = 'server not reachable';
        break;
      case DioErrorType.sendTimeout:
        message = 'send Time out';
        break;
      case DioErrorType.receiveTimeout:
        message = 'server not reachable';
        break;
      case DioErrorType.response:
        message = 'the server response, but with a incorrect status';
        break;
      case DioErrorType.cancel:
        message = 'request is cancelled';
        break;
      case DioErrorType.other:
        error.message.contains('SocketException')
            ? message = 'check your internet connection'
            : message = "Unknown error happened";
        break;
    }
    return DioErrors(message);
  }

  final String message;
}
