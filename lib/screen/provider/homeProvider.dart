import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/postModel.dart';


class HomeProvider extends ChangeNotifier{

  String apilink = "https://newsapi.org/v2/everything?q=tesla&from=2022-12-16&sortBy=publishedAt&apiKey=27427c02f9df4d27adc07ee73d7af4a4";

  Future<PostModel> apicalling(String title,)async{
    var jsonString = await http.get(Uri.parse(apilink));
    var json = jsonDecode(jsonString.body);
    return PostModel.fromJson(json);
  }

}