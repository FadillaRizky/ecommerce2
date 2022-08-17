/// data : [{"id_category":"20","name_category":"Resistor","desc_category":"Resistor Tetap","image_category":"http://localhost/ecom_smaaveros/image/ctgry1655780107.png"},{"id_category":"21","name_category":"Arduino","desc_category":"-","image_category":"http://localhost/ecom_smaaveros/image/ctgry1655827844.png"},{"id_category":"22","name_category":"LCD dan OLED","desc_category":"-","image_category":"http://localhost/ecom_smaaveros/image/ctgry1655828660.png"},{"id_category":"23","name_category":"Motor Servo","desc_category":"-","image_category":"http://localhost/ecom_smaaveros/image/ctgry1655830143.png"},{"id_category":"24","name_category":"Kabel Jumper","desc_category":"-","image_category":"http://localhost/ecom_smaaveros/image/ctgry1655830969.png"},{"id_category":"26","name_category":"Hape","desc_category":"sjdjsdjshdjshdjs","image_category":"http://localhost/ecom_smaaveros/image/ctgry1660551181.png"}]
/// status : 0
/// response : "Data Ditemukan"

class ListCategoryResponse {
  ListCategoryResponse({
      List<Data>? data, 
      int? status, 
      String? response,}){
    _data = data;
    _status = status;
    _response = response;
}

  ListCategoryResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _status = json['status'];
    _response = json['response'];
  }
  List<Data>? _data;
  int? _status;
  String? _response;
ListCategoryResponse copyWith({  List<Data>? data,
  int? status,
  String? response,
}) => ListCategoryResponse(  data: data ?? _data,
  status: status ?? _status,
  response: response ?? _response,
);
  List<Data>? get data => _data;
  int? get status => _status;
  String? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['response'] = _response;
    return map;
  }

}

/// id_category : "20"
/// name_category : "Resistor"
/// desc_category : "Resistor Tetap"
/// image_category : "http://localhost/ecom_smaaveros/image/ctgry1655780107.png"

class Data {
  Data({
      String? idCategory, 
      String? nameCategory, 
      String? descCategory, 
      String? imageCategory,}){
    _idCategory = idCategory;
    _nameCategory = nameCategory;
    _descCategory = descCategory;
    _imageCategory = imageCategory;
}

  Data.fromJson(dynamic json) {
    _idCategory = json['id_category'];
    _nameCategory = json['name_category'];
    _descCategory = json['desc_category'];
    _imageCategory = json['image_category'];
  }
  String? _idCategory;
  String? _nameCategory;
  String? _descCategory;
  String? _imageCategory;
Data copyWith({  String? idCategory,
  String? nameCategory,
  String? descCategory,
  String? imageCategory,
}) => Data(  idCategory: idCategory ?? _idCategory,
  nameCategory: nameCategory ?? _nameCategory,
  descCategory: descCategory ?? _descCategory,
  imageCategory: imageCategory ?? _imageCategory,
);
  String? get idCategory => _idCategory;
  String? get nameCategory => _nameCategory;
  String? get descCategory => _descCategory;
  String? get imageCategory => _imageCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_category'] = _idCategory;
    map['name_category'] = _nameCategory;
    map['desc_category'] = _descCategory;
    map['image_category'] = _imageCategory;
    return map;
  }

}