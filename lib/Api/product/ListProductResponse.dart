/// data : [{"id_product":"1238","name_product":"Resistor 220 , 1/4 watt ","name_category":"Resistor","desc_product":"-","stock_product":"100","price_product":"500","image_product":"http://localhost/ecom_smaaveros/image/prdct1655780228.png","id_category":"20"},{"id_product":"1239","name_product":"Resistor 10K , 1/4 watt","name_category":"Resistor","desc_product":"-","stock_product":"100","price_product":"500","image_product":"http://localhost/ecom_smaaveros/image/prdct1655780492.png","id_category":"20"},{"id_product":"1240","name_product":"Arduino Nano V.03 Chip Serial FTDI","name_category":"Arduino","desc_product":"-","stock_product":"10","price_product":"135000","image_product":"http://localhost/ecom_smaaveros/image/prdct1655828050.png","id_category":"21"},{"id_product":"1241","name_product":"Arduino Nano V.03 Chip Serial CH340","name_category":"Arduino","desc_product":"-","stock_product":"20","price_product":"65000","image_product":"http://localhost/ecom_smaaveros/image/prdct1655828199.png","id_category":"21"},{"id_product":"1242","name_product":"Arduino Uno Chip ATMega 328P","name_category":"Arduino","desc_product":"-","stock_product":"10","price_product":"75000","image_product":"http://localhost/ecom_smaaveros/image/prdct1655828495.png","id_category":"21"},{"id_product":"1243","name_product":"OLED LCD LED 0.96 INCH 128X64 BLUE I2C IIC","name_category":"LCD dan OLED","desc_product":"-","stock_product":"6","price_product":"75000","image_product":"http://localhost/ecom_smaaveros/image/prdct1655828782.png","id_category":"22"},{"id_product":"1244","name_product":"LCD OLED 0.91 Inch White 128X32 I2C Module for Arduino 12832","name_category":"LCD dan OLED","desc_product":"-","stock_product":"10","price_product":"65000","image_product":"http://localhost/ecom_smaaveros/image/prdct1655828940.png","id_category":"22"},{"id_product":"1245","name_product":"I2C LCD Backpack 1602","name_category":"LCD dan OLED","desc_product":"-","stock_product":"25","price_product":"28000","image_product":"http://localhost/ecom_smaaveros/image/prdct1655829389.png","id_category":"22"},{"id_product":"1246","name_product":"LCD BLUE 16X2 1602 I2C SERIAL CONNECTION","name_category":"LCD dan OLED","desc_product":"LCD sudah tersolder I2C","stock_product":"15","price_product":"90000","image_product":"http://localhost/ecom_smaaveros/image/prdct1655829722.png","id_category":"22"},{"id_product":"1247","name_product":"Resitor 1K , 1/4 watt","name_category":"Resistor","desc_product":"-","stock_product":"100","price_product":"500","image_product":"http://localhost/ecom_smaaveros/image/prdct1655829842.png","id_category":"20"}]
/// status : 0
/// response : "Data Ditemukan"

class ListProductResponse {
  ListProductResponse({
      List<Data>? data, 
      int? status, 
      String? response,}){
    _data = data;
    _status = status;
    _response = response;
}

  ListProductResponse.fromJson(dynamic json) {
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
ListProductResponse copyWith({  List<Data>? data,
  int? status,
  String? response,
}) => ListProductResponse(  data: data ?? _data,
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
/// name_category : "Resistor"
/// desc_product : "-"
/// stock_product : "100"
/// price_product : "500"
/// image_product : "http://localhost/ecom_smaaveros/image/prdct1655780228.png"
/// id_category : "20"

class Data {
  Data({
      String? idProduct, 
      String? nameProduct, 
      String? nameCategory, 
      String? descProduct, 
      String? stockProduct, 
      String? priceProduct, 
      String? imageProduct, 
      String? idCategory,}){
    _idProduct = idProduct;
    _nameProduct = nameProduct;
    _nameCategory = nameCategory;
    _descProduct = descProduct;
    _stockProduct = stockProduct;
    _priceProduct = priceProduct;
    _imageProduct = imageProduct;
    _idCategory = idCategory;
}

  Data.fromJson(dynamic json) {
    _idProduct = json['id_product'];
    _nameProduct = json['name_product'];
    _nameCategory = json['name_category'];
    _descProduct = json['desc_product'];
    _stockProduct = json['stock_product'];
    _priceProduct = json['price_product'];
    _imageProduct = json['image_product'];
    _idCategory = json['id_category'];
  }
  String? _idProduct;
  String? _nameProduct;
  String? _nameCategory;
  String? _descProduct;
  String? _stockProduct;
  String? _priceProduct;
  String? _imageProduct;
  String? _idCategory;
Data copyWith({  String? idProduct,
  String? nameProduct,
  String? nameCategory,
  String? descProduct,
  String? stockProduct,
  String? priceProduct,
  String? imageProduct,
  String? idCategory,
}) => Data(  idProduct: idProduct ?? _idProduct,
  nameProduct: nameProduct ?? _nameProduct,
  nameCategory: nameCategory ?? _nameCategory,
  descProduct: descProduct ?? _descProduct,
  stockProduct: stockProduct ?? _stockProduct,
  priceProduct: priceProduct ?? _priceProduct,
  imageProduct: imageProduct ?? _imageProduct,
  idCategory: idCategory ?? _idCategory,
);
  String? get idProduct => _idProduct;
  String? get nameProduct => _nameProduct;
  String? get nameCategory => _nameCategory;
  String? get descProduct => _descProduct;
  String? get stockProduct => _stockProduct;
  String? get priceProduct => _priceProduct;
  String? get imageProduct => _imageProduct;
  String? get idCategory => _idCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_product'] = _idProduct;
    map['name_product'] = _nameProduct;
    map['name_category'] = _nameCategory;
    map['desc_product'] = _descProduct;
    map['stock_product'] = _stockProduct;
    map['price_product'] = _priceProduct;
    map['image_product'] = _imageProduct;
    map['id_category'] = _idCategory;
    return map;
  }

}