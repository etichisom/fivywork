

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter/flutter_counter.dart';
import 'package:flutter_read_more_text/flutter_read_more_text.dart';
import 'package:flutterapp/modalclass/post.dart';
import 'package:flutterapp/modalclass/user.dart';
import 'package:flutterapp/screens/bidjob.dart';

import 'package:flutterapp/screens/postjob.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
   int ammout = 100;
   List<String>dtime=[
     "1 day",'2 days','3 days','4 days','5 days','6 days','1 week'
   ];
   String duration = "1 day";

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Postjob()));

        },
      ),
      body:Container(
        child: StreamBuilder(
          stream: Firestore.instance.collection("jobs").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator());
             

            }
            return ListView(
              children: makelist(snapshot, context, key)
            );
          },
        ),
      )


    );
  }

  List<Widget> makelist(AsyncSnapshot<QuerySnapshot> snapshot, BuildContext context, GlobalKey<ScaffoldState> key) {
    return snapshot.data.documents.map<Widget>((doc) {
      Post post = Post.fromdocument(doc);
      return FutureBuilder(
          future:Firestore.instance.collection("users").document(post.uid).get() ,
          builder: (context,snapshot){
            if(!snapshot.hasData){
              return LinearProgressIndicator();
            }
            User u = User.fromDocument(snapshot.data);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shadowColor: Colors.green,
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(backgroundImage: NetworkImage(u.dp),),
                      title: Text(u.fullname),
                      subtitle: Text(post.timestamp),

                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[200]),
                        child: Column(

                          children: [

                            ReadMoreText(post.desc)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(

                          children: [
                            Row(
                              children: [
                                Icon(Icons.access_time,color: Colors.grey,),
                                SizedBox(width: 10,),
                                Text("Duration",style: TextStyle(color: Colors.grey),),
                                SizedBox(width: 20,),
                                Text(post.devday)

                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Icon(Icons.monetization_on,color: Colors.grey,),
                                SizedBox(width: 10,),
                                Text("Budget",style: TextStyle(color: Colors.grey),),
                                SizedBox(width: 20,),
                                Text("N"+post.budget)

                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Icon(Icons.category,color: Colors.grey,),
                                SizedBox(width: 10,),
                                Text("Cartegory",style: TextStyle(color: Colors.grey),),
                                SizedBox(width: 20,),
                                Text(post.cartigory)

                              ],
                            ),
                            SizedBox(width: 350,
                              child: RaisedButton(onPressed: (){
                                showModalBottomSheet<void>(
                                  isScrollControlled: true,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0)),
                                  ),
                                  builder: (BuildContext context) {
                                    return Padding(
                                        padding: MediaQuery.of(context).viewInsets,
                                        child: Container(
                                          height: 400,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: ListView(
                                              children: [
                                                Center(child: Text('Send offer',
                                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                                SizedBox(height: 15,),

                                                NumberInputPrefabbed.roundedButtons(
                                                  controller: TextEditingController(),
                                                  incDecBgColor: Colors.amber,
                                                  buttonArrangement: ButtonArrangement.rightEnd,
                                                  incDecFactor: 50,
                                                  onIncrement: (num){
                                                    setState(() {
                                                      ammout = num;
                                                      print(num);
                                                    });
                                                    },
                                                ),
                                                SizedBox(height: 15,),
                                                Row(
                                                  children: [


                                                    Text("Delivery date",
                                                      style: TextStyle(fontSize: 15,
                                                          fontWeight: FontWeight.bold,color: Colors.lightBlueAccent),),
                                                    SizedBox(width: 15,),
                                                    DropdownButton<String>(items: dtime.map<DropdownMenuItem<String>>((e){
                                                       return DropdownMenuItem(child: Text(e),
                                                         value: e,
                                                       );
                                                    }).toList(),

                                                        onChanged: (e){
                                                          setState(() {
                                                            duration = e;
                                                            print(duration);
                                                          });
                                                        },
                                                      value: duration,
                                                    ),

                                                  ],
                                                ),
                                                Container(
                                                  height: 90,

                                                  child: TextFormField(
                                                    expands: true,
                                                    maxLines: null,
                                                    minLines: null,
                                                    decoration: InputDecoration(
                                                      labelText: 'Decription'
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 50,),
                                                SizedBox(
                                                  width: 300,
                                                  child: RaisedButton(onPressed: (){},
                                                    color: Colors.green,

                                                    child: Text('Send'),),
                                                )

                                              ],
                                            ),
                                          ),
                                           ));
                                  },
                                );

                               },
                                child: Text("Bid for job",
                                style: TextStyle(color: Colors.white),),color: Colors.green,),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),

              ),
            );
          }
      );
    }).toList();

  }








}
