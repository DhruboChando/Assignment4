import 'package:flutter/material.dart';
import 'package:flutter_app_2/DataFile.dart';
import 'package:flutter_app_2/main.dart';

class AddContacts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Add();
  }
}

class Add extends State<AddContacts> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneNumberController = new TextEditingController();
  String _name = '';
  String _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context); // Go back without saving
          },
        ),
        backgroundColor: Colors.blue,
        title: Text(
          'New contact',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add contact Information',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Roboto',
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_circle),
                labelText: 'Enter name',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
              ),
              cursorColor: Colors.blue,
              keyboardType: TextInputType.text,
              controller: _nameController,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.call),
                labelText: 'Enter phone number',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
              ),
              cursorColor: Colors.blue,
              keyboardType: TextInputType.number,
              controller: _phoneNumberController,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _name = _nameController.text;
                    _phoneNumber = _phoneNumberController.text;

                    if (_name.isNotEmpty && _phoneNumber.isNotEmpty) {
                      SnackBar _snackBar = new SnackBar(
                        content: Text('$_name added!',
                            style: TextStyle(color: Colors.black)),
                        backgroundColor: Colors.white,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(_snackBar);

                      DataFile _newContact = new DataFile(_name, _phoneNumber);

                      // Return the new contact back to the previous screen
                      Navigator.pop(context, _newContact);
                    } else {
                      SnackBar _snackBar = new SnackBar(
                        content: Text('Please fill all the fields!',
                            style: TextStyle(color: Colors.black)),
                        backgroundColor: Colors.white,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                    }
                  },
                  child: Text(
                    'Save ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 1.0,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
