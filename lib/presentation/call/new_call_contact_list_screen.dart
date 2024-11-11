// import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';

class ContactsProvider {
  static const platform = MethodChannel('com.example.contacts');

  Future<dynamic> getContacts() async {
    try {
      final List<dynamic> contacts = await platform.invokeMethod('getContacts');
      print(contacts);
      return contacts;
      // return contacts.cast<Map<String, String>>();
    } on PlatformException catch (e) {
      print("Failed to get contacts: ${e.message}");
      return [];
    }
  }
}

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final ContactsProvider _contactsProvider = ContactsProvider();
  List<Map<String, String>> _contacts = [];

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    final contacts = await _contactsProvider.getContacts();
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          final contact = _contacts[index];

          // return ListTile(
          //   title: Text(contact["name"] ?? ""),
          //   subtitle: Text(contact["phone"] ?? ""),
          // );
          return Container();
        },
      ),
    );
  }
}
