import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class apiservice{
static String baseurl="https://student.valuxapps.com/api/";
static Dio dio=Dio(
  BaseOptions(
    headers: {
      "Content-Type":"application/json"
    }
  )
);
static  postauthdata({required String endpoint,required Map<String,dynamic> data, Map<String,dynamic>? headers})async{
var response=await dio.post("${baseurl+endpoint}",data: data);
print(response.data);
return response.data;
}

}