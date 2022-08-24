/// message : "register user successful"

class RegisterResponse {
  RegisterResponse({
      String? message,}){
    _message = message;
}

  RegisterResponse.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;
RegisterResponse copyWith({  String? message,
}) => RegisterResponse(  message: message ?? _message,
);
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}