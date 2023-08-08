import 'package:ecommerce/Features/login/presentation/views/sign.dart';
import 'package:ecommerce/Features/login/presentation/views/widgets/customcontactrow.dart';
import 'package:ecommerce/Features/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:ecommerce/Features/login/presentation/views/widgets/customsizedbox.dart';
import 'package:ecommerce/Features/login/presentation/views/widgets/cutonnoaccountrow.dart';
import 'package:ecommerce/Features/login/presentation/views/widgets/textformfield.dart';
import 'package:ecommerce/core/utilies/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../consts.dart';
import '../../../../homescrren/homescreen.dart';
import '../viewmodels/authcuibt/auth_cubit.dart';

class login extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController Password = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimarycolor,
      body: Form(
        key: formkey,
        child: Column(
          children: [
            customsizedbox(),
            Expanded(
                child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text("Welcome back !",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Please sign in with your account",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      SizedBox(
                        height: 30,
                      ),
                      textformfield(
                          controller: email,
                          hinttext: "E-mail",
                          valid: "Please enter email"),
                      SizedBox(
                        height: 10,
                      ),
                      textformfield(
                          controller: Password,
                          hinttext: "Password",
                          valid: "Please enter email"),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              "Forget Password?",
                              textAlign: TextAlign.end,
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                          width: double.infinity,
                          child: MaterialButton(
                            onPressed: () async {
                              await BlocProvider.of<AuthCubit>(context).login(email.text, Password.text);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 13, bottom: 13),
                              child: BlocConsumer<AuthCubit, AuthState>(
                                listener: (context, state) {
                                  if(state is loginsuccess){
                                    
                                    snackbar(context,state.loginuser.message!);
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_){
                                    return home();                                  }));
                                  }
                               else   if(state is loginfailure){
                                    
                                    snackbar(context,state.error);
                                
                                  }
                                },
                                builder: (context, state) {
                                  if(state is loginloading) return CircularProgressIndicator(color: Colors.white,);
                                  return Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  );
                                },
                              ),
                            ),
                            color: kprimarycolor,
                            shape: OutlineInputBorder(
                                borderSide: BorderSide(color: kprimarycolor),
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                          child: Text("Or connect using",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12))),
                      SizedBox(
                        height: 15,
                      ),
                      customcontactrow(),
                      SizedBox(
                        height: 100,
                      ),
                      customnoaccountrow(),
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
            )),
          ],
        ),
      ),
    );
  }

   snackbar(BuildContext context,String content) {
   return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text(content),)));
  }
}
