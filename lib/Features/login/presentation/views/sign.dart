import 'package:ecommerce/Features/login/presentation/views/widgets/textformfield.dart';
import 'package:ecommerce/core/utilies/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../consts.dart';
import 'widgets/materialbutton.dart';
import '../viewmodels/authcuibt/auth_cubit.dart';
import 'login.dart';

class signup extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimarycolor,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: kprimarycolor),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Create an account",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.09,
            color: kprimarycolor,
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Welcome !",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Please create an new account",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      const SizedBox(
                        height: 30,
                      ),
                      textformfield(
                          controller: name,
                          hinttext: "name",
                          valid: "Please enter your name"),
                      const SizedBox(
                        height: 10,
                      ),
                      textformfield(
                          controller: email,
                          hinttext: "E-mail",
                          valid: "Please enter email"),
                      const SizedBox(
                        height: 10,
                      ),
                      textformfield(
                          icon: IconButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () {},
                              icon: Icon(Icons.visibility)),
                          controller: Password,
                          hinttext: "Password",
                          valid: "Please enter password"),
                      const SizedBox(
                        height: 10,
                      ),
                      textformfield(
                          controller: phone,
                          hinttext: "Phone",
                          valid: "Please enter your phone"),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                            width: double.infinity,
                            child: MaterialButton(
                              onPressed: () async {
                                if (formkey.currentState!.validate()) {
                                  BlocProvider.of<AuthCubit>(context).signup(
                                      email.text,
                                      Password.text,
                                      phone.text,
                                      name.text);
                                }

                                /*    BlocProvider.of<AuthCubit>(context)
                                          .signup(email.text, Password.text,
                                              confirmpassword.text);*/
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 13, bottom: 13),
                                child: BlocConsumer<AuthCubit, AuthState>(
                                  listener: (context, state) {
                                    if (state is signsuccess) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Center(
                                        child:
                                            Text(state.redistereduser.message!),
                                      )));
                                      Navigator.pop(context);
                                    } else if (state is signfailure)
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Center(
                                        child: Text(state.error),
                                      )));
                                  },
                                  builder: (context, state) {
                                    if (state is signloading)
                                      return Center(
                                          child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ));
                                    return Text(
                                      "Sign up",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    );
                                  },
                                ),
                              ),
                              color: kprimarycolor,
                              shape: OutlineInputBorder(
                                  borderSide: BorderSide(color: kprimarycolor),
                                  borderRadius: BorderRadius.circular(25)),
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Center(
                          child: Text("Or connect using",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12))),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/images/cc.jpg"),
                                  ),
                                  const Text("Facebook")
                                ],
                              ),
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffc5c5c7)
                                          .withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/images/cc.jpg"),
                                  ),
                                  const Text("Google")
                                ],
                              ),
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffc5c5c7)
                                          .withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Have an account ?"),
                          TextButton(
                              onPressed: () async {},
                              child: const Text("Login"))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            decoration: const BoxDecoration(
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
