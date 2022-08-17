/// data : [{"id_feed":"8","title_feed":"Promo akhir tahun","desc_feed":"-","image_feed":"http://localhost/ecom_smaaveros/image/feed1655862937.png","date_feed":"2022-06-22 08:55:37"},{"id_feed":"9","title_feed":"spesial bulanan","desc_feed":"-","image_feed":"http://localhost/ecom_smaaveros/image/feed1655863009.png","date_feed":"2022-06-22 08:56:49"}]
/// status : 200
/// response : "Data Ditemukan"

class ListFeedsResponse {
  ListFeedsResponse({
      List<Data>? data, 
      int? status, 
      String? response,}){
    _data = data;
    _status = status;
    _response = response;
}

  ListFeedsResponse.fromJson(dynamic json) {
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
ListFeedsResponse copyWith({  List<Data>? data,
  int? status,
  String? response,
}) => ListFeedsResponse(  data: data ?? _data,
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

/// id_feed : "8"
/// title_feed : "Promo akhir tahun"
/// desc_feed : "-"
/// image_feed : "http://localhost/ecom_smaaveros/image/feed1655862937.png"
/// date_feed : "2022-06-22 08:55:37"

class Data {
  Data({
      String? idFeed, 
      String? titleFeed, 
      String? descFeed, 
      String? imageFeed, 
      String? dateFeed,}){
    _idFeed = idFeed;
    _titleFeed = titleFeed;
    _descFeed = descFeed;
    _imageFeed = imageFeed;
    _dateFeed = dateFeed;
}

  Data.fromJson(dynamic json) {
    _idFeed = json['id_feed'];
    _titleFeed = json['title_feed'];
    _descFeed = json['desc_feed'];
    _imageFeed = json['image_feed'];
    _dateFeed = json['date_feed'];
  }
  String? _idFeed;
  String? _titleFeed;
  String? _descFeed;
  String? _imageFeed;
  String? _dateFeed;
Data copyWith({  String? idFeed,
  String? titleFeed,
  String? descFeed,
  String? imageFeed,
  String? dateFeed,
}) => Data(  idFeed: idFeed ?? _idFeed,
  titleFeed: titleFeed ?? _titleFeed,
  descFeed: descFeed ?? _descFeed,
  imageFeed: imageFeed ?? _imageFeed,
  dateFeed: dateFeed ?? _dateFeed,
);
  String? get idFeed => _idFeed;
  String? get titleFeed => _titleFeed;
  String? get descFeed => _descFeed;
  String? get imageFeed => _imageFeed;
  String? get dateFeed => _dateFeed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_feed'] = _idFeed;
    map['title_feed'] = _titleFeed;
    map['desc_feed'] = _descFeed;
    map['image_feed'] = _imageFeed;
    map['date_feed'] = _dateFeed;
    return map;
  }

}