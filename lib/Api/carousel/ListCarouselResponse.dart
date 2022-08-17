/// data : [{"id_carousel":"227","img_carousel":"http://localhost/ecom_smaaveros/image/carousel/crsl-1660551546.png"},{"id_carousel":"228","img_carousel":"http://localhost/ecom_smaaveros/image/carousel/crsl-1660551553.png"},{"id_carousel":"229","img_carousel":"http://localhost/ecom_smaaveros/image/carousel/crsl-1660551558.png"},{"id_carousel":"230","img_carousel":"http://localhost/ecom_smaaveros/image/carousel/crsl-1660551564.png"},{"id_carousel":"231","img_carousel":"http://localhost/ecom_smaaveros/image/carousel/crsl-1660551570.png"}]
/// status : 200
/// response : "Data Ditemukan"

class ListCarouselResponse {
  ListCarouselResponse({
      List<Data>? data, 
      int? status, 
      String? response,}){
    _data = data;
    _status = status;
    _response = response;
}

  ListCarouselResponse.fromJson(dynamic json) {
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
ListCarouselResponse copyWith({  List<Data>? data,
  int? status,
  String? response,
}) => ListCarouselResponse(  data: data ?? _data,
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

/// id_carousel : "227"
/// img_carousel : "http://localhost/ecom_smaaveros/image/carousel/crsl-1660551546.png"

class Data {
  Data({
      String? idCarousel, 
      String? imgCarousel,}){
    _idCarousel = idCarousel;
    _imgCarousel = imgCarousel;
}

  Data.fromJson(dynamic json) {
    _idCarousel = json['id_carousel'];
    _imgCarousel = json['img_carousel'];
  }
  String? _idCarousel;
  String? _imgCarousel;
Data copyWith({  String? idCarousel,
  String? imgCarousel,
}) => Data(  idCarousel: idCarousel ?? _idCarousel,
  imgCarousel: imgCarousel ?? _imgCarousel,
);
  String? get idCarousel => _idCarousel;
  String? get imgCarousel => _imgCarousel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_carousel'] = _idCarousel;
    map['img_carousel'] = _imgCarousel;
    return map;
  }

}