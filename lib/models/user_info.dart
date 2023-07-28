import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/firestore_constants.dart';

class User_Info {
  final String id;
  final String photoUrl;
  final String nickname;
  final String aboutMe;
  final String schoolNum;
  final String job;

  const User_Info({required this.id, required this.photoUrl, required this.nickname, required this.aboutMe, required this.schoolNum, required this.job});

  Map<String, String> toJson() {
    return {
      FirestoreConstants.nickname: nickname,
      FirestoreConstants.aboutMe: aboutMe,
      FirestoreConstants.photoUrl: photoUrl,
      FirestoreConstants.schoolNum: schoolNum,
      FirestoreConstants.job: job,
    };
  }

  factory User_Info.fromDocument(DocumentSnapshot doc) {
    String aboutMe = "";
    String photoUrl = "";
    String nickname = "";
    String schoolNum = "";
    String job = "";
    try {
      aboutMe = doc.get(FirestoreConstants.aboutMe);
    } catch (e) {}
    try {
      photoUrl = doc.get(FirestoreConstants.photoUrl);
    } catch (e) {}
    try {
      nickname = doc.get(FirestoreConstants.nickname);
    } catch (e) {}
    try {
      schoolNum = doc.get(FirestoreConstants.schoolNum);
    } catch (e) {}
    try {
      job = doc.get(FirestoreConstants.job);
    } catch (e) {}
    return User_Info(
        id: doc.id,
        photoUrl: photoUrl,
        nickname: nickname,
        aboutMe: aboutMe,
        schoolNum: schoolNum,
        job: job
    );
  }
}