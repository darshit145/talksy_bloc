import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:talksy_app/util/string_const.dart';
class RequestHandler{
  static Future<String> makePostRequest(String url,Map<String,dynamic> data)async{
    var result=await http.post(Uri.parse(url),headers: {'Content-Type': 'application/json'},body: jsonEncode(data));
    if(result.statusCode==200){
      return result.body;
    }
     return StringConst.ERROR;
  }
  static Future<String> makeAnGetRequest(String url)async{
    var result=await http.get(Uri.parse(url),headers:{'Content-Type': 'application/json'},);
    if(result.statusCode==200){
      return result.body;
    }
    return StringConst.ERROR;
  }
}