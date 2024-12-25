import 'package:dartz/dartz.dart';
import 'package:planet_app/core/error/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> login({required String email,required String password});
Future<Either<Failure, String>>  register({required String email,required String password});
}
