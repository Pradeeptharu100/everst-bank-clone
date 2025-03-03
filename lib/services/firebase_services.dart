import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  Future<int> getAmount() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('amount').limit(1).get();

      if (querySnapshot.docs.isNotEmpty) {
        final doc = querySnapshot.docs.first;
        print('Document ID: ${doc.id}');
        print('Document data: ${doc.data()}');
        final amount = doc.data()['amount'];
        if (amount != null) {
          print('Found amount: $amount');
          return amount as int;
        } else {
          print('Amount field is null');
          return 0;
        }
      } else {
        print('No documents found in amount collection');
        final collections =
            await FirebaseFirestore.instance.collection('amount').get();
        print('Collection empty? ${collections.docs.isEmpty}');

        return 0;
      }
    } catch (e) {
      print('Error fetching amount: $e');
      return 0;
    }
  }
}

Future<int> fetchAmount() async {
  final completer = Completer<int>();
  FirestoreService firestoreService = FirestoreService();
  int? amount = await firestoreService.getAmount();

  print("Amount: $amount");
  completer.complete(amount);
  return completer.future;
}
