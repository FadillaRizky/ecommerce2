/// result : {"quantity":"4"}
/// message : "get data success!"

class CheckCartResponse {
  CheckCartResponse({
      Result? result, 
      String? message,}){
    _result = result;
    _message = message;
}

  CheckCartResponse.fromJson(dynamic json) {
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
    _message = json['message'];
  }
  Result? _result;
  String? _message;
CheckCartResponse copyWith({  Result? result,
  String? message,
}) => CheckCartResponse(  result: result ?? _result,
  message: message ?? _message,
);
  Result? get result => _result;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// quantity : "4"

class Result {
  Result({
      String? quantity,}){
    _quantity = quantity;
}

  Result.fromJson(dynamic json) {
    _quantity = json['quantity'];
  }
  String? _quantity;
Result copyWith({  String? quantity,
}) => Result(  quantity: quantity ?? _quantity,
);
  String? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = _quantity;
    return map;
  }

}