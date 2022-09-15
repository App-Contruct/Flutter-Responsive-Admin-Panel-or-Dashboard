import 'package:admin/data/models/user_model.dart';
import 'package:admin/infra/helpers/firebase_errors.dart';
import 'package:admin/infra/keys/keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';


class AuthRepository {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
 // final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<UserModel?> login(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user != null) {
        final DocumentSnapshot doc = await _firestore.collection(Keys.USERS)
            .doc(userCredential.user!.uid).get();

        final user = UserModel.fromDocument(doc);

        return user;
      } else {
        return null;
      }
    } on FirebaseAuthException catch (exception) {
      debugPrint('Erro ao Realizar o Login: ${exception.toString()}');
      return Future.error('${getErrorString(exception.code)}');
    } catch (exception, stackTrace) {
      return Future.error('[ERROR]: $exception, [STACKTRACE]: $stackTrace ');
    }
  }

}