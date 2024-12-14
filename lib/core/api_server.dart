import 'package:firebase_auth/firebase_auth.dart';

 class ApiServer{

  Future<void> register({required String email,required String password})async{
    
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  
 
  }
Future<void> login({required String email,required String password})async{
  
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
 
  }
}