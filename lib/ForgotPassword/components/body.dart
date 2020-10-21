import 'package:flutter/material.dart';
import 'package:flutter_app12/main.dart';

class Body extends StatelessWidget {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:   new Container(
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

      SizedBox(height: size.height * 0.3),

      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: Text(
            'Reset Password',
            style: TextStyle(fontSize: 20,color: Colors.black,),
          )),
      Container(
        alignment: Alignment.center,
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
              labelText: 'Email id',

              labelStyle: TextStyle(

                color: Colors.black,
              )
          ),
        ),
      ),
      Container(
          height: 50,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),

          child: RaisedButton(
            textColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30),
            ),
            color: Colors.orangeAccent,
            child: Text('Submit',style: TextStyle(fontSize: 30),),
            onPressed: () {
              final snackBar = SnackBar(
                content: Text('Link has been sent to Mail!'),
                action: SnackBarAction(
                  label: 'Ok!',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyApp();
                        },
                      ),
                    );
                    // Some code to undo the change.
                  },

                ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
              print(nameController.text);

            },
          )),

    ],
    ),
      )
    );
  }}