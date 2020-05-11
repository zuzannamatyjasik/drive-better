import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String id;
  DatabaseServices({ this.id });

  final CollectionReference infoCollection = Firestore.instance.collection('info');

  Future updateUserData(String numerTelefonu) async {
    return await infoCollection.document(id).setData({
      'numerTelefonu': numerTelefonu
    });
  }

  getData () async {
    String numerTelefonu;
    DocumentSnapshot snapshot = await Firestore.instance.collection('info').document(id).get();
    if (snapshot.exists) {
      numerTelefonu = (snapshot['numerTelefonu']).toString();
    }
    else {
      numerTelefonu = 'brak danych';
    }
    return numerTelefonu;
  }

}