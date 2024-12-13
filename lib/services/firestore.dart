import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  // get collection of data
  final CollectionReference complaints = FirebaseFirestore.instance.collection("complaints");

  // create: add a new complain
  Future<void> addComplaint(String note){
    return complaints.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

  // READ: reading complain from firestore
  Stream<QuerySnapshot> getComplaintStream(){
    final complaintStream = complaints.orderBy("timestamp", descending: true).snapshots();
    
    return complaintStream;
  }

  // update:
  Future<void> updateComplaint(String docID, String newComplaint){
    return complaints.doc(docID).update({
      'note': newComplaint,
      'timestamp': Timestamp.now(),
    });
  }

}