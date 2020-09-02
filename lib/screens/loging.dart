import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/screens/home.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email, password;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ProgressDialog p = ProgressDialog(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('LOG INTO ACCOUNT',style: TextStyle(color: Colors.white),)),

      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
        child: Container(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                Center(child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.black,fontStyle: FontStyle.italic),)),
                SizedBox(height: 20,),
                TextFormField(
                  onChanged: (va){
                    setState(() {
                      email =va;
                    });
                  },
                  validator: (pass){
                    if(pass.isEmpty){
                      return "email cant be empty";

                    } else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(border: OutlineInputBorder(),
                  labelText: "email",
                ),),
                SizedBox(height: 30,),
                TextFormField(onChanged: (va){
                  setState(() {
                    password =va;
                  });
                },obscureText: true,
                  validator: (pass){
                    if(pass.isEmpty){
                      return "password cant be empty";

                    } else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(border: OutlineInputBorder(),
                  labelText: "password",
                ),),
                SizedBox(height: 30,),
                RaisedButton(onPressed: (){
                  if(formkey.currentState.validate()){
                    p.show();
                    FirebaseAuth.instance.signInWithEmailAndPassword(email:email, password: password)
                        .then((value) {
                      if(value != null){
                        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => Home()));
                      }
                    }).catchError((err){
                      p.hide();
                      print(err);
                    });
                  }
                 },
                  child: Text("Sign up into fivywork",style: TextStyle(color: Colors.white,),),
                  color:Colors.green[500] ,),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
