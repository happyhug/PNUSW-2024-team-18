import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomAuthProvider with ChangeNotifier {
  UserCredential? _userCredential;
  String? _uid;
  Map<String, dynamic>? _userInfo;
  File? _image;

  UserCredential? get userCredential => _userCredential;
  Map<String, dynamic>? get userInfo => _userInfo;
  String? get uid => _uid;
  File? get image => _image;

  void setUserCredential(UserCredential userCredential) {
    _userCredential = userCredential;
    fetchUserInfo(userCredential.user!.uid);
  }

  Future<void> fetchUserInfo(String uid) async {
    final doc =
        await FirebaseFirestore.instance.collection('user').doc(uid).get();
    if (doc.exists) {
      _userInfo = doc.data();
      _uid = uid;
      notifyListeners();
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    _userCredential = null;
    _userInfo = null;
    notifyListeners();
  }

  void setImage(File? image) {
    _image = image;
    notifyListeners();
  }

  void clearImageFile() {
    _image = null;
    notifyListeners();
  }
}
