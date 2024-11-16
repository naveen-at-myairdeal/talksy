
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
}
