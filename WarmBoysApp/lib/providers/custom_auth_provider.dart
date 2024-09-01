import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class CustomAuthProvider with ChangeNotifier {
  UserCredential? _userCredential;
  String? _uid;
  Map<String, dynamic>? _userInfo;
  File? _image;
  Uint8List? _profileImageBytes;

  UserCredential? get userCredential => _userCredential;
  Map<String, dynamic>? get userInfo => _userInfo;
  String? get uid => _uid;
  File? get image => _image;
  Uint8List? get profileImageBytes => _profileImageBytes;

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
      // 이미지 다운로드 및 메모리에 저장
      if (_userInfo!['imgUrl'] != null) {
        await _downloadAndStoreProfileImage(_userInfo!['imgUrl']);
      }
      notifyListeners();
    }
  }

  Future<void> _downloadAndStoreProfileImage(String imageUrl) async {
    try {
      // 이미지 다운로드
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        _profileImageBytes = response.bodyBytes; // 이미지를 메모리에 저장
        notifyListeners();
      }
    } catch (e) {
      print('Failed to download profile image: $e');
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