import 'dart:convert';

import 'package:http/http.dart' as http;
class RequestHandler{
  static Future<String> makePostRequest(String url,Map<String,dynamic> data)async{
    var result=await http.post(Uri.parse(url),headers: {'Content-Type': 'application/json'},body: jsonEncode(data));
    print(result.body);
    return "";
  }
}