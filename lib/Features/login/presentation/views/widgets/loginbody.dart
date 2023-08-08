import 'package:ecommerce/Features/login/presentation/views/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../consts.dart';
import '../../viewmodels/authcuibt/auth_cubit.dart';
import '../sign.dart';
import 'customcontactrow.dart';
import 'custommaterialbutton.dart';
import 'customsizedbox.dart';
import 'cutonnoaccountrow.dart';

class loginbody extends StatelessWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController email;
  final TextEditingController Password;

  const loginbody(
      {super.key,
      required this.formkey,
      required this.email,
      required this.Password});
  @override
  Widget build(BuildContext context) {
    return Form(
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
                    custommaterialbutton(
                        formkey: formkey,
                        email: email.text,
                        password: Password.text),
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
    );
  }
}
