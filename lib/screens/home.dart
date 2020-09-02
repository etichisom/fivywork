import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/screens/loging.dart';
import 'package:flutterapp/screens/profile.dart';
import 'package:flutterapp/screens/proposal.dart';
import 'package:flutterapp/screens/timeline.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final tab = [
    Timeline(),
    Proposal()
  ];
   int currentindex = 0;
   String dp = "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png";
   String username = "Loading........";
   String uid;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 15,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.whatshot),title:Text("timeline"),backgroundColor: Colors.green),
          BottomNavigationBarItem(icon: Icon(Icons.work),title:Text("proposal"),backgroundColor: Colors.green),
          BottomNavigationBarItem(icon: Icon(Icons.message),title:Text("message"),backgroundColor: Colors.green),
          BottomNavigationBarItem(icon: Icon(Icons.search),title:Text("search"),backgroundColor: Colors.green),
        ],
        onTap: (index){
          setState(() {
            currentindex = index;
          });
        },
      ),
      appBar: AppBar(backgroundColor: Colors.green,),
      drawer: Drawer(
        child: ListView(children: [
          DrawerHeader(child: Container(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(dp),
                  radius: 40,
                ),
                SizedBox(height: 10,),
                Text(username,style: TextStyle(fontSize: 17),)
              ],
            ),
          ),decoration: BoxDecoration(color: Colors.blue),),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()) );
            }
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("sign_out"),
            onTap: (){
                signout();
              }



          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
        ],),
      ),
      body: tab[currentindex],
    );
  }

  void signout() {
    FirebaseAuth.instance.signOut().whenComplete(() =>  Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=>Login())));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getinfo();
  }

   getinfo() async{

     FirebaseAuth.instance.onAuthStateChanged.listen((event) {
       if(event != null){

         Firestore.instance.collection("users").document(event.uid).get()
             .then((value){
           print(value.data);
           setState(() {
             dp = value.data["dp"];
           });
           setState(() {
             username = value.data['name'];
           });
         });

       }
     });

   }

}
