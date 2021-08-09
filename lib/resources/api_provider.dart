import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_quize/models/category.dart';
import 'package:new_quize/models/question.dart';

const String baseUrl = "https://opentdb.com/api.php";

Future<List<Question>> getQuestions(BuildContext context,Category category, int total, String difficulty) async {
 /* String url = "$baseUrl?amount=$total&category=${category.id}";
  if(difficulty != null) {
    url = "$url&difficulty=$difficulty";
  }*/
  //http.Response res = await http.get(Uri.parse(url));

  List<Map<String, dynamic>> questions=[];
  var data;
  if(category.id==9){
    data=await DefaultAssetBundle.of(context).loadString("assets/json/genaral_knowledge.json");
  }else if(category.id==10){
    data=await DefaultAssetBundle.of(context).loadString("assets/json/genaral_knowledge_c2.json");
  }else if(category.id==11){
    data=await DefaultAssetBundle.of(context).loadString("assets/json/genaral_knowledge_c3.json");
  }
  var jsonResult=json.decode(data);
  //print(jsonResult.toString());
  List<dynamic>tempData = jsonResult['results'];
  print(tempData.toString());
  for(int i=0;i<total;i++){
    questions.add(tempData[i]);
  }
  return Question.fromData(questions);
}