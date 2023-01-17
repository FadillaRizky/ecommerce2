/// message : "Add Success!"

class AddCartResponse {
  AddCartResponse({
      String? message,}){
    _message = message;
}

  AddCartResponse.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;
AddCartResponse copyWith({  String? message,
}) => AddCartResponse(  message: message ?? _message,
);
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}