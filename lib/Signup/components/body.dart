import 'package:flutter/material.dart';
import 'package:flutter_app12/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app12/components/already_have_an_account_check.dart';

class Body extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController firstNameInputController = TextEditingController();
  final TextEditingController lastNameInputController = TextEditingController();
  final TextEditingController emailInputController = TextEditingController();
  final TextEditingController pwdInputController = TextEditingController();
  final TextEditingController confirmPwdInputController = TextEditingController();

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  bool _success;
  String _userEmail;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(


        body:   new Container(
          key: _formKey,
        decoration: BoxDecoration(
        gradient: LinearGradient(
        colors: <Color>[
        Colors.blue,
        Colors.lightBlueAccent,
        ],
        stops: [0.0,1.0],
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
        tileMode: TileMode.repeated,)),


        child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: (
                      Image.asset('assets/images/logo-removebg-preview (5).png',height:150)
                  )),
             // SizedBox(height: size.height * 0.03),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20,color: Colors.black,),
                  )),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(

                      borderRadius : BorderRadius.circular(30),
                      borderSide : BorderSide(color: Theme.of(context).primaryColor,
                        width : 2,),
                    ) ,
                    prefixIcon: Icon(Icons.account_circle_outlined,color: Colors.black,),
                    labelText: 'First Name*', hintText: "Carry"),
                controller: firstNameInputController,
                // ignore: missing_return
                validator: (value) {
                  if (value.length < 3) {
                    return "Please enter a valid first name.";
                  }
                },
              ),
              TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(

                        borderRadius : BorderRadius.circular(30),
                        borderSide : BorderSide(color: Theme.of(context).primaryColor,
                          width : 2,),
                      ) ,
                      prefixIcon: Icon(Icons.account_circle_outlined,color: Colors.black,),
                      labelText: 'Last Name*', hintText: "Minati"),
                  controller: lastNameInputController,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.length < 3) {
                      return "Please enter a valid last name.";
                    }
                  }),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(

                      borderRadius : BorderRadius.circular(30),
                      borderSide : BorderSide(color: Theme.of(context).primaryColor,
                        width : 2,),
                    ) ,


                  prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                  labelText: 'Email*', hintText: "carry.minati@gmail.com",
                  labelStyle: TextStyle(

                    color: Colors.black,
                  )
                ),
                controller: emailInputController,
                keyboardType: TextInputType.emailAddress,
                validator: emailValidator,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(

                      borderRadius : BorderRadius.circular(30),
                      borderSide : BorderSide(color: Theme.of(context).primaryColor,
                        width : 2,),
                    ) ,
                    prefixIcon: Icon(Icons.lock_outlined,color: Colors.black,),
                  labelText: 'Password*', hintText: "********",
                  labelStyle: TextStyle(
                      color: Colors.black,
                    )

                ),
                controller: pwdInputController,
                obscureText: true,
                validator: pwdValidator,
              ),
              TextFormField(

                decoration: InputDecoration(
                    border: OutlineInputBorder(

                      borderRadius : BorderRadius.circular(30),
                      borderSide : BorderSide(color: Theme.of(context).primaryColor,
                        width : 2,),
                    ) ,
                    prefixIcon: Icon(Icons.lock_outlined,color: Colors.black,),
                    labelText: 'Confirm Password*', hintText: "********"),
                controller: confirmPwdInputController,
                obscureText: true,
                validator: pwdValidator,
              ),


            SizedBox(height: size.height * 0.03),

            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),

                child: RaisedButton(
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30),
                  ),
                  color: Colors.orangeAccent,
                  child: Text('Sign Up',style: TextStyle(fontSize: 30),),
                  onPressed: () {

                    print(_emailController.text);
                    print(confirmPwdInputController.text);
                    final FirebaseAuth _auth = FirebaseAuth.instance;

                  },
                )),
              Container(
                alignment: Alignment.center,
                child: Text(_success == null
                    ? ''
                    : (_success
                    ? 'Successfully registered ' + _userEmail
                    : 'Registration failed')),
              ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyApp();
                    },
                  ),
                );
              },
            ),

          ],

        ),
        ),
    );
  }
}
