import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_4bhif/pages/add_contact_page.dart';

import '../providers/contacts.dart';
import '../widgets/contact_item.dart';

class ContactsOverviewPage extends StatefulWidget {
  const ContactsOverviewPage({Key? key}) : super(key: key);

  @override
  State<ContactsOverviewPage> createState() => _ContactsOverviewPageState();
}

// FutureBuilder
class _ContactsOverviewPageState extends State<ContactsOverviewPage> {
  var loading = false;

  @override
  Future<void> didChangeDependencies() async {
    setState(() {
      loading = true;
    });
    await Provider.of<Contacts>(context, listen: false).loadContacts();
    setState(() {
      loading = false;
    });
    Timer.periodic(Duration(seconds: 1), (timer) {
      print(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => new AddContactPage()));
        },
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Consumer<Contacts>(
              child: const Divider(), //------v
              builder: (context, contacts, child) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: RefreshIndicator(
                  onRefresh: () {
                    print('refreshing');
                    return didChangeDependencies();
                  },
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        ContactItem(contacts.all[index]),
                    itemCount: contacts.all.length,
                    separatorBuilder: (_, __) => child!,
                  ),
                ),
              ),
            ),
    );
  }
}
