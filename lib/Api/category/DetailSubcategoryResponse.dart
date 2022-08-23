/// data : [{"id_product":"1238","name_product":"Resistor 220 , 1/4 watt ","desc_product":"-","stock_product":"100","price_product":"500","image_product":"prdct1655780228.png","id_category":"20","id_subcategory":"1576","name_category":"Resistor","desc_category":"Resistor Tetap","image_category":"ctgry1655780107.png"},{"id_product":"1239","name_product":"Resistor 10K , 1/4 watt","desc_product":"-","stock_product":"100","price_product":"500","image_product":"prdct1655780492.png","id_category":"20","id_subcategory":"1576","name_category":"Resistor","desc_category":"Resistor Tetap","image_category":"ctgry1655780107.png"},{"id_product":"1247","name_product":"Resitor 1K , 1/4 watt","desc_product":"-","stock_product":"100","price_product":"500","image_product":"prdct1655829842.png","id_category":"20","id_subcategory":"1576","name_category":"Resistor","desc_category":"Resistor Tetap","image_category":"ctgry1655780107.png"}]
/// status : 200
/// response : "Data ada"

class DetailSubcategoryResponse {
  DetailSubcategoryResponse({
      List<Data>? data, 
      int? status, 
      String? response,}){
    _data = data;
    _status = status;
    _response = response;
}

  DetailSubcategoryResponse.fromJson(dynamic json) {
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
DetailSubcategoryResponse copyWith({  List<Data>? data,
  int? status,
  String? response,
}) => DetailSubcategoryResponse(  data: data ?? _data,
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

/// id_product : "1238"
/// name_product : "Resistor 220 , 1/4 watt "
/// desc_product : "-"
/// stock_product : "100"
/// price_product : "500"
/// image_product : "prdct1655780228.png"
/// id_category : "20"
/// id_subcategory : "1576"
/// name_category : "Resistor"
/// desc_category : "Resistor Tetap"
/// image_category : "ctgry1655780107.png"

class Data {
  Data({
      String? idProduct, 
      String? nameProduct, 
      String? descProduct, 
      String? stockProduct, 
      String? priceProduct, 
      String? imageProduct, 
      String? idCategory, 
      String? idSubcategory, 
      String? nameCategory, 
      String? descCategory, 
      String? imageCategory,}){
    _idProduct = idProduct;
    _nameProduct = nameProduct;
    _descProduct = descProduct;
    _stockProduct = stockProduct;
    _priceProduct = priceProduct;
    _imageProduct = imageProduct;
    _idCategory = idCategory;
    _idSubcategory = idSubcategory;
    _nameCategory = nameCategory;
    _descCategory = descCategory;
    _imageCategory = imageCategory;
}

  Data.fromJson(dynamic json) {
    _idProduct = json['id_product'];
    _nameProduct = json['name_product'];
    _descProduct = json['desc_product'];
    _stockProduct = json['stock_product'];
    _priceProduct = json['price_product'];
    _imageProduct = json['image_product'];
    _idCategory = json['id_category'];
    _idSubcategory = json['id_subcategory'];
    _nameCategory = json['name_category'];
    _descCategory = json['desc_category'];
    _imageCategory = json['image_category'];
  }
  String? _idProduct;
  String? _nameProduct;
  String? _descProduct;
  String? _stockProduct;
  String? _priceProduct;
  String? _imageProduct;
  String? _idCategory;
  String? _idSubcategory;
  String? _nameCategory;
  String? _descCategory;
  String? _imageCategory;
Data copyWith({  String? idProduct,
  String? nameProduct,
  String? descProduct,
  String? stockProduct,
  String? priceProduct,
  String? imageProduct,
  String? idCategory,
  String? idSubcategory,
  String? nameCategory,
  String? descCategory,
  String? imageCategory,
}) => Data(  idProduct: idProduct ?? _idProduct,
  nameProduct: nameProduct ?? _nameProduct,
  descProduct: descProduct ?? _descProduct,
  stockProduct: stockProduct ?? _stockProduct,
  priceProduct: priceProduct ?? _priceProduct,
  imageProduct: imageProduct ?? _imageProduct,
  idCategory: idCategory ?? _idCategory,
  idSubcategory: idSubcategory ?? _idSubcategory,
  nameCategory: nameCategory ?? _nameCategory,
  descCategory: descCategory ?? _descCategory,
  imageCategory: imageCategory ?? _imageCategory,
);
  String? get idProduct => _idProduct;
  String? get nameProduct => _nameProduct;
  String? get descProduct => _descProduct;
  String? get stockProduct => _stockProduct;
  String? get priceProduct => _priceProduct;
  String? get imageProduct => _imageProduct;
  String? get idCategory => _idCategory;
  String? get idSubcategory => _idSubcategory;
  String? get nameCategory => _nameCategory;
  String? get descCategory => _descCategory;
  String? get imageCategory => _imageCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_product'] = _idProduct;
    map['name_product'] = _nameProduct;
    map['desc_product'] = _descProduct;
    map['stock_product'] = _stockProduct;
    map['price_product'] = _priceProduct;
    map['image_product'] = _imageProduct;
    map['id_category'] = _idCategory;
    map['id_subcategory'] = _idSubcategory;
    map['name_category'] = _nameCategory;
    map['desc_category'] = _descCategory;
    map['image_category'] = _imageCategory;
    return map;
  }

}