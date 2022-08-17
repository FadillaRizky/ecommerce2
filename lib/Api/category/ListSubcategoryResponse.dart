/// data : [{"id_subcategory":"1576","id_category":"20","name_category":"Resistor","name_subcategory":"Resistor 1/4 watt","desc_subcategory":"- -","image_subcategory":"http://localhost/ecom_smaaveros/image/subctgry1655780170.png"},{"id_subcategory":"1582","id_category":"20","name_category":"Resistor","name_subcategory":"Resistor 1 watt","desc_subcategory":"-","image_subcategory":"http://localhost/ecom_smaaveros/image/subctgry1655830737.png"},{"id_subcategory":"1583","id_category":"20","name_category":"Resistor","name_subcategory":"Kabel Jumper Female - Female","desc_subcategory":"-","image_subcategory":"http://localhost/ecom_smaaveros/image/subctgry1655831065.png"}]
/// status : 200
/// response : "Data ada"

class ListSubcategoryResponse {
  ListSubcategoryResponse({
      List<Data>? data, 
      int? status, 
      String? response,}){
    _data = data;
    _status = status;
    _response = response;
}

  ListSubcategoryResponse.fromJson(dynamic json) {
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
ListSubcategoryResponse copyWith({  List<Data>? data,
  int? status,
  String? response,
}) => ListSubcategoryResponse(  data: data ?? _data,
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

/// id_subcategory : "1576"
/// id_category : "20"
/// name_category : "Resistor"
/// name_subcategory : "Resistor 1/4 watt"
/// desc_subcategory : "- -"
/// image_subcategory : "http://localhost/ecom_smaaveros/image/subctgry1655780170.png"

class Data {
  Data({
      String? idSubcategory, 
      String? idCategory, 
      String? nameCategory, 
      String? nameSubcategory, 
      String? descSubcategory, 
      String? imageSubcategory,}){
    _idSubcategory = idSubcategory;
    _idCategory = idCategory;
    _nameCategory = nameCategory;
    _nameSubcategory = nameSubcategory;
    _descSubcategory = descSubcategory;
    _imageSubcategory = imageSubcategory;
}

  Data.fromJson(dynamic json) {
    _idSubcategory = json['id_subcategory'];
    _idCategory = json['id_category'];
    _nameCategory = json['name_category'];
    _nameSubcategory = json['name_subcategory'];
    _descSubcategory = json['desc_subcategory'];
    _imageSubcategory = json['image_subcategory'];
  }
  String? _idSubcategory;
  String? _idCategory;
  String? _nameCategory;
  String? _nameSubcategory;
  String? _descSubcategory;
  String? _imageSubcategory;
Data copyWith({  String? idSubcategory,
  String? idCategory,
  String? nameCategory,
  String? nameSubcategory,
  String? descSubcategory,
  String? imageSubcategory,
}) => Data(  idSubcategory: idSubcategory ?? _idSubcategory,
  idCategory: idCategory ?? _idCategory,
  nameCategory: nameCategory ?? _nameCategory,
  nameSubcategory: nameSubcategory ?? _nameSubcategory,
  descSubcategory: descSubcategory ?? _descSubcategory,
  imageSubcategory: imageSubcategory ?? _imageSubcategory,
);
  String? get idSubcategory => _idSubcategory;
  String? get idCategory => _idCategory;
  String? get nameCategory => _nameCategory;
  String? get nameSubcategory => _nameSubcategory;
  String? get descSubcategory => _descSubcategory;
  String? get imageSubcategory => _imageSubcategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_subcategory'] = _idSubcategory;
    map['id_category'] = _idCategory;
    map['name_category'] = _nameCategory;
    map['name_subcategory'] = _nameSubcategory;
    map['desc_subcategory'] = _descSubcategory;
    map['image_subcategory'] = _imageSubcategory;
    return map;
  }

}