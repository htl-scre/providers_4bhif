import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_4bhif/pages/contacts_overview_page.dart';
import 'package:providers_4bhif/providers/contacts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return MultiProvider(providers: providers)
    return ChangeNotifierProvider<Contacts>(
      create: (context) => Contacts(),
      child: MaterialApp(
        home: ContactsOverviewPage(),
      ),
    );
  }
}
