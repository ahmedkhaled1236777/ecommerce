import 'package:bloc/bloc.dart';
import 'package:ecommerce/Features/login/data/models/loginuser/loginuser.dart';
import 'package:ecommerce/Features/login/data/repos/auth_repoimplement.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../data/models/registerd_user/registerd_user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
final  authrepo_implement authrepo;
  AuthCubit({required this.authrepo}) : super(AuthInitial());
  signup(String email, String password, String phone,String name) async {
      emit(signloading());
      var result=await authrepo.signup(endpoint: "register", thedata: {
        "name":name,
"email":email,
"password":password,
"phone":phone
      });
      result.fold((failure){
emit(signfailure(error: failure.errormessage));
      }, (succes) {
emit(signsuccess(redistereduser: succes));
      });
   
  }
  login(String email, String password) async {
      emit(loginloading());
      var result=await authrepo.login(endpoint: "login", thedata:{
	"email": email,
	"password": password,
});
      result.fold((failure){
        emit(loginfailure(error: failure.errormessage));
      }, (succes) {
        emit(loginsuccess(loginuser: succes));
      });
    
  }
}
