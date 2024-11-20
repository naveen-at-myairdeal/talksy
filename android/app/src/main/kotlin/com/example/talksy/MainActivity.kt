package com.example.talksy
import android.Manifest
import android.content.ContentValues
import android.content.pm.PackageManager
import android.provider.ContactsContract
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.contacts"

    // This is the updated version of the method
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getContacts" -> {
                    if (ContextCompat.checkSelfPermission(this, Manifest.permission.READ_CONTACTS) == PackageManager.PERMISSION_GRANTED) {
                        result.success(getContacts())
                    } else {
                        ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.READ_CONTACTS), 1)
                        result.error("PERMISSION_DENIED", "Contacts permission denied", null)
                    }
                }
                "addContact" -> {
                    val name = call.argument<String>("name") ?: ""
                    val phone = call.argument<String>("phone") ?: ""
                    if (ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_CONTACTS) == PackageManager.PERMISSION_GRANTED) {
                        addContact(name, phone)
                        result.success("Contact added successfully")
                    } else {
                        ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.WRITE_CONTACTS), 2)
                        result.error("PERMISSION_DENIED", "Write permission denied", null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun getContacts(): List<Map<String, String>> {
        val contacts = mutableListOf<Map<String, String>>()
        val cursor = contentResolver.query(
            ContactsContract.CommonDataKinds.Phone.CONTENT_URI,
            null,
            null,
            null,
            ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME + " ASC" // Sort by display name alphabetically
        )

        cursor?.use {
            while (it.moveToNext()) {
                val name = it.getString(it.getColumnIndex(ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME))
                val phoneNumber = it.getString(it.getColumnIndex(ContactsContract.CommonDataKinds.Phone.NUMBER))
                contacts.add(mapOf("name" to name, "phone" to phoneNumber))
            }
        }

        return contacts
    }

    private fun addContact(name: String, phone: String) {
        val contentValues = ContentValues()
        contentValues.put(ContactsContract.RawContacts.ACCOUNT_TYPE, "")  // Use an empty string here instead of null
        contentValues.put(ContactsContract.RawContacts.ACCOUNT_NAME, "")
        val rawContactUri = contentResolver.insert(ContactsContract.RawContacts.CONTENT_URI, contentValues)
        
        val rawContactId = rawContactUri?.lastPathSegment?.toLong() ?: return

        // Insert Name
        val nameValues = ContentValues()
        nameValues.put(ContactsContract.Data.RAW_CONTACT_ID, rawContactId)
        nameValues.put(ContactsContract.Data.MIMETYPE, ContactsContract.CommonDataKinds.StructuredName.CONTENT_ITEM_TYPE)
        nameValues.put(ContactsContract.CommonDataKinds.StructuredName.DISPLAY_NAME, name)
        contentResolver.insert(ContactsContract.Data.CONTENT_URI, nameValues)

        // Insert Phone Number
        val phoneValues = ContentValues()
        phoneValues.put(ContactsContract.Data.RAW_CONTACT_ID, rawContactId)
        phoneValues.put(ContactsContract.Data.MIMETYPE, ContactsContract.CommonDataKinds.Phone.CONTENT_ITEM_TYPE)
        phoneValues.put(ContactsContract.CommonDataKinds.Phone.NUMBER, phone)
        phoneValues.put(ContactsContract.CommonDataKinds.Phone.TYPE, ContactsContract.CommonDataKinds.Phone.TYPE_MOBILE)
        contentResolver.insert(ContactsContract.Data.CONTENT_URI, phoneValues)
    }
}
