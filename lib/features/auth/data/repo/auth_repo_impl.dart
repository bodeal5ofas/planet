import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:planet_app/core/api_server.dart';
import 'package:planet_app/core/error/failure.dart';
import 'package:planet_app/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  ApiServer apiServer;
  AuthRepoImpl(this.apiServer);
  @override
  Future<Either<Failure, String>> login(
      {required String email, required String password}) async{
   try {
      await apiServer.login(email: email, password: password);
      return const Right('sucess');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
       return left(ServerFailure(errorMessage: 'user-not-found'));
      } else if (e.code == 'wrong-password') {
       return left(ServerFailure(errorMessage: 'wrong-password'));
      }else{
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
    }
    
      @override
      Future<Either<Failure, String>> register({required String email, required String password}) async{
   try {
      await apiServer.register(email: email, password: password);
     return Right('Sucess');
    } on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
   return left(ServerFailure(errorMessage: 'The password provided is too weak.'));
  } else if (e.code == 'email-already-in-use') {
   return Left(ServerFailure(errorMessage: 'The account already exists for that email.'));
  }else{
    return left(ServerFailure(errorMessage: e.toString())); 
  }
} catch (e) {
  return left(ServerFailure(errorMessage: e.toString()));
}
      }
  }
  
  
  
