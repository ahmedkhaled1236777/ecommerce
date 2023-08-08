import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../consts.dart';
import '../../viewmodels/authcuibt/auth_cubit.dart';

class custommaterialbutton extends StatelessWidget {
  final GlobalKey<FormState> formkey;
  final String email;
  final String password;
  const custommaterialbutton(
      {super.key,
      required this.formkey,
      required this.email,
      required this.password});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        child: MaterialButton(
          onPressed: () {
            if (formkey.currentState!.validate()) {
              BlocProvider.of<AuthCubit>(context).login(email, password);
            }
          },
          child: const Padding(
            padding: EdgeInsets.only(top: 13, bottom: 13),
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          color: kprimarycolor,
          shape: OutlineInputBorder(
              borderSide: const BorderSide(color: kprimarycolor),
              borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }
}
