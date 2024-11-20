import 'package:flutter/services.dart';

class ContactsProvider {
  static const platform = MethodChannel('com.example.contacts');

  Future<dynamic> getContacts() async {
    try {
      var contacts = await platform.invokeMethod('getContacts');
      // log(contacts.toString());
      return contacts;
      // return contacts.cast<Map<dynamic, dynamic>>();
    } on PlatformException catch (e) {
      print("Failed to get contacts: ${e.message}");
      return [];
    }
  }

  static const MethodChannel _channel = MethodChannel('com.example.contacts');

  List<Map<String, String>> _contacts = [];

  List<Map<String, String>> get contacts => _contacts;

  Future<void> addContact(String name, String phone) async {
    try {
      await _channel.invokeMethod('addContact', {'name': name, 'phone': phone});
      // Refresh contacts after adding a new one
      await getContacts();
    } on PlatformException catch (e) {
      print("Failed to add contact: '${e.message}'.");
    }
  }
}
