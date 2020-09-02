import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class User{
  String occupation;
  String zipcode;
  String aboutme;
  String address;
  String sex;
  String fullname;
  String skills;
  String dp;
  String uid;
  String number;

  User({this.occupation, this.zipcode, this.aboutme, this.address, this.sex,
      this.fullname, this.skills, this.dp, this.uid, this.number});
  factory User.fromDocument(DocumentSnapshot doc){
    return User(
      fullname: doc["name"],
      occupation: doc["occupation"],
      zipcode: doc["zipcode"],
      dp: doc["dp"],
      address: doc["address"],
      sex: doc["sex"],
      skills: doc["skills"],
      uid: doc["name"],
      number: doc["number"],
      aboutme: doc["aboutme"],

    );
  }


}