import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

void main() {
  //앱 시작해주세요.
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 10;
  var total = 3;
  List<Contact> names = [];

  addNames(contacts) async {
    var contacts = await ContactsService.getContacts();
    setState(() {
      names = contacts;
    });
  }

  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      var contacts = await ContactsService.getContacts();
      setState(() {
        names = contacts;
      });
    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return MyModal(addNames: addNames);
              });
        }),
        appBar: AppBar(
          backgroundColor: Colors.black12,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                getPermission();
              },
              color: Colors.black,
            ),
          ],
          title: Text(total.toString()),
        ),
        body: ListView.builder(
            itemCount: names.length,
            itemBuilder: (c, i) {
              return ListTile(title: Text(names[i].givenName.toString()));
            }));
  }
}

class MyModal extends StatelessWidget {
  MyModal({Key? key, this.addNames}) : super(key: key);

  var addNames;
  addContact(inputData) async {
    var newPerson = new Contact();
    newPerson.givenName = inputData;
    await ContactsService.addContact(newPerson);
    addNames(newPerson);
  }

  var inputData = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      height: 250,
      width: 250,
      padding: EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Contact",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
            ),
            TextField(
              onChanged: (text) {
                inputData = text;
              },
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () {
                    addContact(inputData);
                  },
                  child: Text("OK"))
            ])
          ]),
    ));
    ;
  }
}
