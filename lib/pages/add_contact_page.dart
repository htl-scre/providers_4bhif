import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/contact.dart';
import '../providers/contacts.dart';

class AddContactPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  AddContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final contact = Contact('NEW', '201');
    //Provider.of<Contacts>(context, listen: false).addContact(contact);
    return Scaffold(
        appBar: AppBar(title: Text('New contact')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.always,
                    controller: phoneNumberController,
                    decoration: InputDecoration(label: Icon(Icons.phone)),
                    keyboardType: TextInputType.phone,
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      final formState = _formKey.currentState;
                      if (formState == null) return;
                      if (formState.validate()) {
                        final contact = Contact(
                          nameController.text,
                          phoneNumberController.text,
                        );
                        Provider.of<Contacts>(context, listen: false)
                            .addContact(contact);
                        Navigator.of(context).pop();
                      }
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              )),
        ));
  }
}
