import 'package:flutter/material.dart';

import '../domain/contact.dart';

class Contacts with ChangeNotifier{
  final _all = <Contact>[
    new Contact('Alfred', '02132'),
    new Contact('Bernd', '0245'),
    new Contact('Christina', '0346346'),
  ];

  List<Contact> get all {
    return [..._all];
  }

  void addContact(Contact contact) {
    _all.add(contact);
    notifyListeners();
  }

}
