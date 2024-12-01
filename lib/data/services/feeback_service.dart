import 'package:cloud_firestore/cloud_firestore.dart';

class FeebackService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> create(Map<String, dynamic> data) async {
    await firestore.collection('feedback').add(data);
  }
}