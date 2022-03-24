import 'package:flutter/material.dart';

import '../domain/contact.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;

  const ContactItem(this.contact, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${contact.name}, ${contact.id}'),
      subtitle: Text(contact.phoneNumber),
    );
  }
}
