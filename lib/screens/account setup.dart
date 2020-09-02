


import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/screens/home.dart';
import 'package:image_picker/image_picker.dart';



class Setup extends StatefulWidget {
  @override
  _SetupState createState() => _SetupState();
}


class _SetupState extends State<Setup> {

  String fullname,occupation,aboutme,zipcode,address,sex,skills,uid,dp,number;
  String skill = "Specialization";
   List<String> specialization = [
    "mobiledevelopmet",
    "web designer","photographer",
    "videoeditor",'Eletrician',"Technician","Tutorialmaster"
  ];
   File phtourl;


   StorageReference storageReference = FirebaseStorage.instance.ref();
   final formkey = GlobalKey<FormState>();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body:Container(
        color: Colors.black54,

        child: Column(


            children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 0, 30),
              child: Container(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text("ACCONT SETUP",style: TextStyle(fontSize: 30,color: Colors.white),)
                  ],
                ),
              ),
            ),
          Expanded(

             child: Container(

                  decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60))),
               child: SingleChildScrollView(
                 child: Column(

                   children: [
                     SizedBox(height: 10,),


                     CircleAvatar(
                       radius: 70,

                       backgroundColor: Colors.grey,
                       child: ClipOval(
                         child:  phtourl != null?CircleAvatar(backgroundImage: FileImage(phtourl),radius: 70,):Icon(Icons.camera_alt),
                       ),
                     ),
                    FlatButton.icon(onPressed: (){chossephoto(context);}, icon: Icon(Icons.edit), label: Text("choose photo")),
                     SizedBox(height: 15,),
                     Form(
                       key: formkey,
                         child: Padding(
                           padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                           child: Container(
                             child: Column(

                               children: [

                                 TextFormField(
                                   validator: (pass){
                                     if(pass.isEmpty){
                                       return "fied cannot be empty";

                                     } else{
                                       return null;
                                     }
                                   },
                                   onChanged: (va){
                                       setState(() {
                                         fullname = va;
                                       });
                                   },
                                   decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius
                                       .all(Radius.circular(6))),labelText: "Full Name"),
                                 ),
                                 SizedBox(height: 10,),
                                 TextFormField(
                                   validator: (pass){
                                     if(pass.isEmpty){
                                       return "fied cannot be empty";

                                     } else{
                                       return null;
                                     }
                                   },
                                   onChanged: (va){
                                     setState(() {
                                       address = va;
                                     });
                                   },
                                   decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius
                                       .all(Radius.circular(6))),labelText: "residential address"),
                                 ),
                                 SizedBox(height: 10,),
                                 TextFormField(
                                   validator: (pass){
                                     if(pass.isEmpty){
                                       return "fied cannot be empty";

                                     } else{
                                       return null;
                                     }
                                   },
                                   onChanged: (va){
                                     setState(() {
                                       occupation = va;
                                     });
                                   },
                                   decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius
                                       .all(Radius.circular(6))),labelText: "occupation"),
                                 ),
                                 SizedBox(height: 10,),


                                 TextFormField(
                                   validator: (pass){
                                     if(pass.isEmpty){
                                       return "fied cannot be empty";

                                     } else{
                                       return null;
                                     }
                                   },
                                   onChanged: (va){
                                     setState(() {
                                       zipcode = va;
                                     });
                                   },
                                   decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius
                                       .all(Radius.circular(5))),labelText: "zipcode"),
                                 ),
                                 SizedBox(height: 10,),
                                 TextFormField(
                                   validator: (pass){
                                     if(pass.isEmpty){
                                       return "fied cannot be empty";

                                     } else{
                                       return null;
                                     }
                                   },
                                   onChanged: (va){
                                     setState(() {
                                       aboutme = va;
                                     });
                                   },
                                   decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius
                                       .all(Radius.circular(5))),labelText: "About me"),
                                 ),
                                 SizedBox(height: 10,),
                                 TextFormField(
                                   validator: (pass){
                                     if(pass.isEmpty){
                                       return "fied cannot be empty";

                                     } else{
                                       return null;
                                     }
                                   },
                                   onChanged: (va){
                                     setState(() {
                                       sex= va;
                                     });
                                   },
                                   decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius
                                       .all(Radius.circular(5))),labelText: "sex"),
                                 ),
                                 SizedBox(height: 10,),
                                 TextFormField(
                                   validator: (pass){
                                     if(pass.isEmpty){
                                       return "fied cannot be empty";

                                     }
                                     else{
                                       return null;
                                     }
                                   },
                                   onChanged: (va){
                                     setState(() {
                                       number = va;
                                     });
                                   },
                                   decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius
                                       .all(Radius.circular(5))),labelText: "phonenumber"),
                                 ),
                                 SizedBox(height: 10,),
                                 TextFormField(
                                   validator: (pass){
                                     if(pass.isEmpty){
                                       return "fied cannot be empty";

                                     } else{
                                       return null;
                                     }
                                   },
                                   onChanged: (va){
                                     setState(() {
                                       skills= va;
                                     });
                                   },
                                   decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius
                                       .all(Radius.circular(5))),labelText: "skill"),
                                 ),
                                 SizedBox(height: 10,),
                                 RaisedButton(onPressed: (){
                                   if(formkey.currentState.validate()){
                                     if(phtourl !=null&& uid!= null){
                                       uploadinfor();
                                     }
                                   }
                                  },
                                   color: Colors.blueAccent,
                                   child: Text("submit",style: TextStyle(color: Colors.white),),
                                 )



                               ],
                             ),
                           ),
                         )
                     )


                   ],
                 ),
               ),
          ),

    ),
          ],
        ),
      ),
    );
  }

  chossephoto(BuildContext text) {
    return showDialog(context: text,builder: (context){
      return SimpleDialog(
        title: Text("choose image"),
        children: [
          SimpleDialogOption(
            child: Text("select from local storage"),
            onPressed: (){
              picimage();

            },
          ),
          SimpleDialogOption(
            child: Text("take a picture"),
            onPressed: (){
              takephoto();
            },
          ),
          SimpleDialogOption(
            child: Text("cancel"),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      );
    });
  }

  void picimage() async{
    Navigator.pop(context);
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      phtourl = file;
      print(phtourl);
    });
  }
  void takephoto() async{
    Navigator.pop(context);
    File file= await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      phtourl = file;


    });
  }

   uploadinfor  ()async {
   await storageReference.child(uid).putFile(phtourl).onComplete
        .then((value) async {
         String link = await value.ref.getDownloadURL();
         setState(() {
           dp = link;
         });
    })
        .catchError((e){print(e);});
   Firestore.instance.collection("users").document(uid).setData(
     {
       "name":fullname,
       "occupation":occupation,
       "aboutme":aboutme,
       "zipcode":zipcode,
       "address":address,
       "sex":sex,
       "skills":skills,
       "uid":uid,
       "dp":dp,
       "number":number
     }
   ).then((value) => Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=> Home())))
       .catchError((e){
         print(e);
   });


  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.onAuthStateChanged.listen((event) {
     setState(() {
       uid=event.uid;
     });
    });
  }
}
