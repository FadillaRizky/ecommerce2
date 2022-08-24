
import 'dart:convert';

import 'package:ecommerce2/Api/auth/RegisterResponse.dart';
import 'package:ecommerce2/Api/product/DetailProductResponse.dart';
import 'package:ecommerce2/Api/product/ListProductResponse.dart';
import 'package:http/http.dart' as http;

import 'carousel/ListCarouselResponse.dart';
import 'category/DetailSubcategoryResponse.dart';
import 'category/ListCategoryResponse.dart';
import 'category/ListSubcategoryResponse.dart';
import 'feed/ListFeedsResponse.dart';


const BASE_URL = "http://192.168.18.18/ecom_smaaveros/index.php/Api/";

class Api {

  static const IMG_URL = 'http://192.168.18.18/ecom_smaaveros/image/';

  static Future<ListCarouselResponse> getListCarousel() async{
    var url = BASE_URL + "Carousel/select_carousel";

    // print(url);
    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return ListCarouselResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to show list Carousel";
    }
  }
  static Future<ListFeedsResponse> getListFeeds() async{
    var url = BASE_URL + "Feed/select_feed";

    // print(url);
    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return ListFeedsResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to show list product";
    }
  }
  static Future<ListProductResponse> getListProduct() async{
    var url = BASE_URL + "Product/select_product";

    // print(url);
    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return ListProductResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to show list product";
    }
  }
  static Future<DetailProductResponse> getDetailProduct(String IdProduk) async{
    var url = BASE_URL + "Product/select_product_by_id/$IdProduk";

    // print(url);
    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return DetailProductResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to show detail product";
    }
  }
  static Future<ListCategoryResponse> getListCategory() async{
    var url = BASE_URL + "Category/select_category";

    // print(url);
    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return ListCategoryResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to show list category";
    }
  }

  static Future<ListSubcategoryResponse> getListSubcategory(String id) async{
    var url = BASE_URL + "Category/select_list_subcategory/$id";

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return ListSubcategoryResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to show list product";
    }
  }

  static Future<DetailSubcategoryResponse> getDetailSubcategory(String id) async {
    var url = BASE_URL + "Category/select_subcategory_by_id/$id";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return DetailSubcategoryResponse.fromJson(jsonDecode(response.body));
    } else {
      throw "Unable to show list product";
    }
  }
  static Future<RegisterResponse> submitRegister(Map<String,String>dataUser) async {
    var url = BASE_URL + "Auth/register";

    var response = await http.post(Uri.parse(url),body: dataUser);

    if (response.statusCode == 200) {
      return RegisterResponse.fromJson(jsonDecode(response.body));
    } else {
      throw "Unable to submit Register";
    }
  }}