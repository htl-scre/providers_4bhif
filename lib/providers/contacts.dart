import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../domain/contact.dart';

class Contacts with ChangeNotifier {
  var _all = <Contact>[
  ];

  List<Contact> get all {
    return [..._all];
  }

  Future<void> loadContacts() async {
    final uri = Uri.parse(
        'https://bhif-contacts-default-rtdb.europe-west1.firebasedatabase.app/contacts.json');
    final response = await http.get(uri);
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    _all = body
        .entries
        .map((entry) => Contact.fromJson(entry.key, entry.value))
        .toList();
  }

  Future<void> addContact(Contact contact) async {
    final uri = Uri.parse(
        'https://bhif-contacts-default-rtdb.europe-west1.firebasedatabase.app/contacts.json');
    final response = await http.post(
      uri,
      body: jsonEncode(contact.toJson()),
    );
    //response ist da!
    final body = jsonDecode(response.body);
    contact.id = body['name'];  //firebase returnt IMMER name
    _all.add(contact);
    notifyListeners();
  }
}
