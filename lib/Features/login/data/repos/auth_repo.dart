import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/loginuser/loginuser.dart';
import '../models/registerd_user/registerd_user.dart';
abstract class authrepo{

Future< Either<failure,RegisterdUser>>signup({required String endpoint,required Map<String,dynamic>thedata});
Future< Either<failure,Loginuser>>login({required String endpoint,required Map<String,dynamic>thedata});}