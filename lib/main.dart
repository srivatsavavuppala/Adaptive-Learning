import 'package:flutter/material.dart';
import 'package:flutter_app12/screens/home_page.dart';
import 'package:flutter_app12/ForgotPassword/ForgotPassword_Screen.dart';
import 'package:flutter_app12/Signup/Signup_Screen.dart';
import 'package:flutter_app12/components/already_have_an_account_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    title: 'DevTrons',
    // Set FV Almelo as the default app font.
    theme: ThemeData(fontFamily: 'Comic Sans MS'),

  ));
}
class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _showPassword = false;
  Widget buildforgetpassword(){
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ForgotPassword();
              },
            ),
          );
          print('icon forgot password pressed');
          // Forgot password screen
        },
        textColor: Colors.black,
        child: Text('Forgot Password?'),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      //appBar: AppBar(
      //title: Text('Adaptive Learning- DevTrons'),
      //),
        body:   new Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/main_bg.jpg"),
                    fit: BoxFit.cover)),

            //decoration: BoxDecoration(
            //    gradient: LinearGradient(
            //      colors: <Color>[
             //       Colors.blue,
             //       Colors.lightBlueAccent,
             //     ],
             //     stops: [0.0,1.0],
             //     begin: FractionalOffset.topCenter,
             //     end: FractionalOffset.bottomCenter,
             //     tileMode: TileMode.repeated,)),

            padding: new EdgeInsets.all(10),

            child: ListView(
              children: <Widget>[

                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: (
                        Image.asset('assets/images/logo-removebg-preview (5).png',height:150)
                    )),
                SizedBox(height: size.height * 0.03),

                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20,color: Colors.black,),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.black),
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius : BorderRadius.circular(30),
                          borderSide : BorderSide(color: Theme.of(context).primaryColor,
                            width : 2,),
                        ) ,
                        prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                        labelText: 'User Name',

                        labelStyle: TextStyle(

                          color: Colors.black,
                        )
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: !this._showPassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius : BorderRadius.circular(30),
                        borderSide : BorderSide(color: Theme.of(context).primaryColor,
                          width : 2,),
                      ),
                      labelText: 'password',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      prefixIcon: Icon(Icons.lock_outlined,color: Colors.black),
                      suffixIcon: IconButton(
                        icon: Icon(
                          this._showPassword ? Icons.remove_red_eye : Icons.visibility_off,

                          color: this._showPassword ? Colors.black : Colors.black,
                        ),
                        onPressed: () {
                          setState(() => this._showPassword = !this._showPassword);
                        },
                      ),
                    ),

                  ),
                ),
                buildforgetpassword(),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),

                    child: RaisedButton(
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30)),
                        color: Colors.orangeAccent,
                        child: Text('Login',style: TextStyle(fontSize: 30),
                        ),
                        onPressed: ()
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ContentPage();
                              },
                            ),
                          );
                          print(nameController.text);
                          print(passwordController.text);
                        }
                      //add authentication part
                    )),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  login: true,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ),
                    );
                  },
                ),

              ],
            ))
    );
  }
}