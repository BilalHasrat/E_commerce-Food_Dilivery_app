import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser(){
    return  auth.currentUser;
  }

  Future signOut()async{
    await auth.signOut();
  }

  Future deleteUser()async{
    User? user = auth.currentUser;
    user!.delete();
  }
}