import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
  String desc,budget,uid,postid;
  String devday ;
  String subcategory;
  String cartigory ;
  String timestamp;

  Post({this.desc, this.budget, this.uid, this.postid, this.devday,
      this.subcategory, this.cartigory, this.timestamp});
  factory Post.fromdocument(DocumentSnapshot doc){
    return Post(
      desc: doc["desc"],
      budget: doc["budget"],
      uid: doc["uid"],
      postid: doc["postid"],
      timestamp: doc["timestamp"],
      subcategory: doc["subcategory"],
      cartigory: doc["category"],
      devday: doc["dtime"],
    );
  }

}