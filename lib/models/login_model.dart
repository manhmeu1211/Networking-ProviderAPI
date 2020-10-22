class LoginModel {
  int _status;
  Response _response;
  String _errorMessage;
  int _errorCode;

  LoginModel({int status, Response response, String errorMessage, int errorCode}) {
    this._status = status;
    this._response = response;
    this._errorMessage = errorMessage;
    this._errorCode = errorCode;
  }

  int get status => _status;
  set status(int status) => _status = status;
  Response get response => _response;
  set response(Response response) => _response = response;
  String get errorMessage => _errorMessage;
  set errorMessage(String errorMessage) => _errorMessage = errorMessage;
  int get errorCode => _errorCode;
  set errorCode(int errorCode) => _errorCode = errorCode;

  LoginModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
    _errorMessage = json['error_message'];
    _errorCode = json['error_code'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._response != null) {
      data['response'] = this._response.toJson();
    }
    data['error_message'] = this._errorMessage;
    data['error_code'] = this._errorCode;
    return data;
  }
}

class Response {
  String _token;

  Response({String token}) {
    this._token = token;
  }

  String get token => _token;
  set token(String token) => _token = token;

  Response.fromJson(Map<String, dynamic> json) {
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this._token;
    return data;
  }
}