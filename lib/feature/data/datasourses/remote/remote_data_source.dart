import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shadows_beta_01/core/error/exception/exception.dart';
import 'package:shadows_beta_01/feature/data/datasourses/remote/firebase_remote_data_sourse.dart';
import 'package:shadows_beta_01/feature/data/models/page_model.dart';
import 'package:shadows_beta_01/feature/data/models/update_novel_saves_data_model.dart';

class FirebaseRemoteDataSource implements IFirebaseRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  FirebaseRemoteDataSource(this.auth, this.firestore);
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Future<void> novelSavesUpdate(
      {required Timestamp lastSave,
      required int messageNum,
      required String route,
      required int pageNum,
      required String level,
      required String uid}) async {
    final dateTime = Timestamp.fromDate(DateTime.now());
    return firestore
        .collection('users')
        .doc(uid)
        .collection('saves')
        .doc('saves')
        .set(NovelSavesModel(
                level: level,
                lastSave: dateTime,
                messageNum: messageNum,
                route: route,
                pageNum: pageNum)
            .toJson());
  }

  @override
  Future<List<String>> getNovelData(
      {required String uid,
      required String page,
      String? level = "levelOne"}) async {
    final novelDocRef =
        firestore.collection('Novels').doc(uid).collection('levels').doc(level);
    return await (novelDocRef
        .snapshots()
        .map((docRefs) => json.encode(PageModel.fromSnapshot(docRefs, page)))
        .toList());
  }

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<String> novelSavesGet(String uid) async {
    final savesDocRef = await firestore
        .collection('users')
        .doc(uid)
        .collection('saves')
        .doc('saves')
        .get();
    return savesDocRef.toString();
  }

  @override
  Future<UserCredential> signIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (message) {
      throw AuthException(message.toString());
    }
  }

  @override
  Future<void> signOut() async => auth.signOut();

  @override
  getUid() async {
    final uid = auth.currentUser!.uid;
    return uid;
  }
}
