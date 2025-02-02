import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shersoft/model/dataModel.dart';
import 'package:flutter/material.dart';

class Datacontroller with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Datamodel> _filteredData = [];

  String selected = "All";

  List<Datamodel> get filteredData => _filteredData;

  Future<void> getdata(String filter) async {
    _filteredData = await _fetchData(filter);
    notifyListeners();
  }

  void selectedColor(String filter) {
    if (selected != filter) {
      selected = filter;
    }
    notifyListeners();
  }

  Future<List<Datamodel>> _fetchData(String filter) async {
    try {
      DateTime now = DateTime.now();
      CollectionReference collectionRef = _firestore.collection('cash_book');
      Query query = collectionRef;

      if (filter == "Today") {
        DateTime startOfDay = DateTime(now.year, now.month, now.day);
        DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);
        query = query
            .where('timestamp',
                isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
            .where('timestamp',
                isLessThanOrEqualTo: Timestamp.fromDate(endOfDay));
      } else if (filter == "Weekly") {
        DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        DateTime endOfWeek = startOfWeek.add(Duration(days: 6));
        query = query
            .where('timestamp',
                isGreaterThanOrEqualTo: Timestamp.fromDate(startOfWeek))
            .where('timestamp',
                isLessThanOrEqualTo: Timestamp.fromDate(endOfWeek));
      } else if (filter == "Monthly") {
        DateTime startOfMonth = DateTime(now.year, now.month, 1);
        DateTime endOfMonth = DateTime(now.year, now.month + 1, 0, 23, 59, 59);
        query = query
            .where('timestamp',
                isGreaterThanOrEqualTo: Timestamp.fromDate(startOfMonth))
            .where('timestamp',
                isLessThanOrEqualTo: Timestamp.fromDate(endOfMonth));
      }

      QuerySnapshot querySnapshot = await query.get();

      List<Datamodel> data = querySnapshot.docs.map((doc) {
        Map<String, dynamic> docData = doc.data() as Map<String, dynamic>;
        return Datamodel.fromFireBase(docData);
      }).toList();

      return data;
    } catch (e) {
      log("Error fetching data: $e");
      return [];
    }
  }
}
