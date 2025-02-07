import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_task_app/Home_page/model/Note.dart';
import 'package:my_task_app/authentication/viewmodel/authentication.dart';
import 'package:uuid/uuid.dart';

class DbFirestore {
  // firebasefirstore instance
  final FirebaseFirestore _Firestoredb = FirebaseFirestore.instance;

  // add data on detabase function
  Future<void> Adddata(
      String title, String discription, String imageurl) async {
    try {
      var uuid = Uuid().v4();
      await _Firestoredb.collection('users')
          .doc(Authentication().CurrentUser?.uid)
          .collection('note')
          .doc(uuid)
          .set({
        'id': uuid,
        'title': title,
        'discription': discription,
        'imageurl': imageurl
      });
    } catch (e) {
      print('add data fundtion exception $e');
    }
  }

  // stream data on data bade
  Stream<QuerySnapshot> stream() {
    // Make isDone nullable since it's not used
    try {
      return _Firestoredb.collection('users')
          .doc(Authentication().CurrentUser?.uid)
          .collection('note')
          .orderBy('title')
          .snapshots();
    } catch (e) {
      return Stream.error(e);
    }
  }

  Future<void> getnote() async {
    try {
      await _Firestoredb.collection('users')
          .doc(Authentication().CurrentUser?.uid)
          .collection('note')
          .snapshots();
    } catch (e) {
      print(e);
    }
  }

  List<Note> getNotes(AsyncSnapshot<QuerySnapshot> snapshot) {
    try {
      if (!snapshot.hasData) {
        return [];
      }

      final notesList = snapshot.data!.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Note(data['title'] ?? '', data['discription'] ?? '',
            data['imageurl'] ?? '', data['id'] ?? doc.id);
      }).toList();

      print('Retrieved ${notesList.length} notes');
      return notesList;
    } catch (e) {
      print('Error in getNotes: $e');
      return [];
    }
  }
}



//  Stream<QuerySnapshot> stream(bool isDone) {
//     return _Firestoredb.collection('users')
//         .doc(Authentication().CurrentUser?.uid)
//         .collection('note')
//         .orderBy('title')
//         .snapshots();
//   }

//   // get funcion
//   List getNotes(AsyncSnapshot snapshot) {
//     try {
//       final notesList = snapshot.data!.docs.map((doc) {
//         final data = doc.data() as Map<String, dynamic>;
//         return Note(
//             data['title'], data['discription'], data['imageurl'], data['id']);
//       }).toList();
//       print(notesList);
//       return notesList;
//     } catch (e) {
//       print('get note function erorr $e');
//       return [];
//     }
//   }