
import 'package:e_commers_app/pages/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_widget.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String email = "", password = "";

  final _formKey= GlobalKey<FormState>();

  TextEditingController useremailcontroller = new TextEditingController();
  TextEditingController userpasswordcontroller = new TextEditingController();

  // userLogin() async {
  //   try {
  //     await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: password);
  //     Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNav()));
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           content: Text(
  //             "No User Found for that Email",
  //             style: TextStyle(fontSize: 18.0, color: Colors.black),
  //           )));
  //     }else if(e.code=='wrong-password'){
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           content: Text(
  //             "Wrong Password Provided by User",
  //             style: TextStyle(fontSize: 18.0, color: Colors.black),
  //           )));
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFff5c30),
                        Color(0xFFe74b1a),
                      ])),
            ),
            Container(
              margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Text(""),
            ),
            Container(
              margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Center(
                      child: Image.asset(
                        "images/logo.png",
                        width: MediaQuery.of(context).size.width / 1.5,
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                "Login",
                                style: AppWidget.headlineTextFieldStyle(),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              TextFormField(
                                controller: useremailcontroller,
                                validator: (value){
                                  if(value==null|| value.isEmpty){
                                    return 'Please Enter Email';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                    prefixIcon: Icon(Icons.email_outlined)),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              TextFormField(
                                controller:userpasswordcontroller,
                                validator: (value){
                                  if(value==null|| value.isEmpty){
                                    return 'Please Enter Password';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                    prefixIcon: Icon(Icons.password_outlined)),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              GestureDetector(
                                onTap: (){
                                  //Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassword()));
                                },
                                child: Container(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "Forgot Password?",
                                      style: AppWidget.semiBoldTextFieldStyle(),
                                    )),
                              ),
                              SizedBox(
                                height: 80.0,
                              ),
                              GestureDetector(
                                onTap: (){
                                  if(_formKey.currentState!.validate()){
                                    setState(() {
                                      email= useremailcontroller.text;
                                      password= userpasswordcontroller.text;
                                    });
                                  }
                                 // userLogin();
                                },
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 8.0),
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: Color(0Xffff5722),
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Center(
                                        child: Text(
                                          "LOGIN",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontFamily: 'Poppins1',
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const SignUp()));
                      },
                      child: Text(
                        "Don't have an account? Sign up",
                        style: AppWidget.semiBoldTextFieldStyle(),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
