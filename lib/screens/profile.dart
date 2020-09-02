

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/modalclass/user.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String uid;
  CollectionReference user = Firestore.instance.collection('user');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blue,
            title: Text("profile"),
            expandedHeight: 100,
            flexibleSpace: Text("profile"),

            pinned: true,
          ),
          SliverFillRemaining(

            child:FutureBuilder(

                future:Firestore.instance.collection("users").document(uid).get() ,
                builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }else if( snapshot.hasError){
                    return CircularProgressIndicator();
                  }if(snapshot.hasData){
                    User u = User.fromDocument(snapshot.data);
                    print(u.aboutme);
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Card(
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white70),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(


                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(u.dp),
                                    radius: 70,
                                  ),
                                  SizedBox(height: 10,),
                                  Text(u.fullname,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 2,),
                                  Text(u.aboutme,style: TextStyle(fontSize: 16),),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        SizedBox(child:
                                         RaisedButton(onPressed: (){}, color: Colors.lightGreen,child: Text("message"),),width: 140,
                                        ),
                                        SizedBox(child:
                                         RaisedButton(onPressed: (){},child: Text("Custom order"),) ,width: 140,
                                        ),

                                      ],

                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Divider(color: Colors.black,),
                                  SizedBox(height: 10,),
                                  Text("Contact info",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 8,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Phone number",style: TextStyle(fontSize: 18,),),
                                      Text(u.number,style: TextStyle(fontSize: 17),)
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("address",style: TextStyle(fontSize: 18,),),
                                      Text(u.address,style: TextStyle(fontSize: 10),)
                                    ],

                                  ),
                                  Divider(color: Colors.black,),
                                  Text("Basic info",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Fullname",style: TextStyle(fontSize: 18,),),
                                      Text(u.fullname,style: TextStyle(fontSize: 17),)
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("sex",style: TextStyle(fontSize: 18,),),
                                      Text(u.number,style: TextStyle(fontSize: 17),)
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("occupation",style: TextStyle(fontSize: 18,),),
                                      Text(u.occupation,style: TextStyle(fontSize: 17),)
                                    ],

                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Skill",style: TextStyle(fontSize: 18,),),
                                      Text(u.skills,style: TextStyle(fontSize: 17),)
                                    ],

                                  ),




                                ],
                              ),
                            ),

                          ),
                        ),
                      ),
                    );
                  }else{
                    return CircularProgressIndicator();
                  }
                }
            ),
          )
        ],
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userinfo();

  }

   userinfo()  {
     FirebaseAuth.instance.onAuthStateChanged.listen((event) {
       setState(()  {
         uid = event.uid.toString();

       });
       Firestore.instance.collection('users').document(uid).get()
           .then((value){
             if(value != null){
             print(value.data);
             print("hiiiiiiiiiiiiiii");
             }else{
               print("okoooooo");
             }
       }).catchError((e){
         print("erooe what went wrong"+e);
       });

     });

   }
}
