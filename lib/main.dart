import 'package:ecommerce/Features/login/presentation/views/login.dart';
import 'package:ecommerce/Features/login/presentation/views/sign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Features/login/data/repos/auth_repoimplement.dart';
import 'Features/login/presentation/viewmodels/authcuibt/auth_cubit.dart';
import 'firebase_options.dart';
import 'homescrren/homescreen.dart';
import 'Features/onboarding/presentation/view/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(authrepo: authrepo_implement()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: login(),
      ),
    );
  }
}
