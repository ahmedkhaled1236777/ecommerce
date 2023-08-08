import 'package:dio/dio.dart';
import 'package:ecommerce/Features/login/data/models/loginuser/loginuser.dart';
import 'package:ecommerce/Features/login/data/models/registerd_user/registerd_user.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/Features/login/data/repos/auth_repo.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/core/utilies/apiservice.dart';

class authrepo_implement extends authrepo{
  @override
  Future<Either<failure, RegisterdUser>> signup({required String endpoint,required Map<String,dynamic> thedata}) async{
    RegisterdUser registerdUser;
    try{
      var data=await apiservice.postauthdata(endpoint: endpoint, data: thedata);
      registerdUser=RegisterdUser.fromJson(data);
      if(data["status"]==false)return left(serverfailure(data["message"]));
      return right(registerdUser);
    }catch(e){
      if(e is DioException)return left(serverfailure.fromdioerror(e));
      else return left(serverfailure(e.toString()));
    }
  }
  
  @override
  Future<Either<failure, Loginuser>> login({required String endpoint, required Map<String, dynamic> thedata})async {
     Loginuser loginuser;
    try{
      var data=await apiservice.postauthdata(endpoint: endpoint, data: thedata);
      loginuser=Loginuser.fromJson(data);
      if(data["status"]==false)return left(serverfailure(data["message"]));
      return right(loginuser);
    }catch(e){
      if(e is DioException)return left(serverfailure.fromdioerror(e));
      else return left(serverfailure(e.toString()));
    }

   
  }
}