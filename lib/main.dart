import 'package:flutter/material.dart';
import 'package:flutter_app_2/AddContacts.dart';
import 'DataFile.dart';

void main() {
  runApp(DevContact());
}

class DevContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev.contact',
      debugShowCheckedModeBanner: false,
      home: DevHome(),
    );
  }
}

class DevHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DevStates();
  }
}

class DevStates extends State<DevHome> {
  List<String> _nameData = ['Kajal Rani', 'Anup Chando Dhrubo', 'Shuvo'];
  List<String> _jobTitle = ['01721394003', '01975624707', '01975624707'];
  String _imageId = 'images/user_icon.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Contacts',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        children: List.generate(_nameData.length, (index) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(_imageId),
                    margin: EdgeInsets.only(right: 16),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_nameData.elementAt(index)),
                      SizedBox.fromSize(size: Size(0, 8)),
                      Text(_jobTitle.elementAt(index)),
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 50,
                    width: 50,
                    child: IconButton(onPressed: () {
                      //delete contact information
                      //save information for undo functionality
                      String _deletedNameData = _nameData.removeAt(index);
                      String _deletedJobTitle = _jobTitle.removeAt(index);

                      setState(() {

                      });

                      SnackBar _snack = new SnackBar(content: Text('Deleted $_deletedNameData',
                        style: TextStyle(color: Colors.black),
                      ),
                        action: SnackBarAction(label: 'Undo', onPressed: () {
                          //insert deleted data and set it to the screen
                          setState(() {
                            _nameData.insert(index, _deletedNameData);
                            _jobTitle.insert(index, _deletedJobTitle);

                          });
                        },textColor: Colors.blue,),
                        backgroundColor: Colors.white,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(_snack);

                    },
                        icon: Icon(Icons.delete)
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var newContact = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddContacts(),
            ),
          );

          if (newContact != null) {
            setState(() {
              _nameData.add(newContact.name);
              _jobTitle.add(newContact.phoneNumber);
            });
          }
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        tooltip: 'Add new contact',
      ),
    );
  }
}
