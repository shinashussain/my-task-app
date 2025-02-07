import 'package:cloud_firestore/cloud_firestore.dart';
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
}
