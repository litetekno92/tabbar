import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://imediasen.litetekno.tk";

class APICAT {
  
  static Future fetchDataCat(int category) {
    var url = baseUrl + "/wp-json/wp/v2/posts?categories=" + category.toString() + "&_embed";
    // return http.get(url,headers: {"Accept": "application/json"});
    return http.get(url);
  }
}
