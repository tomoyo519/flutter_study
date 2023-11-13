import 'package:flutter/material.dart';

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
  var names = ['a', 'b', 'c'];
  addOne(name) {
    setState(() {
      names.add(name.toString());
    });
    print(names);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return MyModal(addOne: addOne);
              });
        }),
        appBar: AppBar(
          backgroundColor: Colors.black12,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: Colors.black,
            ),
          ],
          title: Text(total.toString()),
        ),
        body: ListView.builder(
            itemCount: names.length,
            itemBuilder: (c, i) {
              return ListTile(title: Text(names[i]));
            }));
  }
}

class MyModal extends StatelessWidget {
  MyModal({Key? key, this.addOne}) : super(key: key);
  var addOne;

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
                    print('찍힘?');
                    addOne(inputData);
                  },
                  child: Text("OK"))
            ])
          ]),
    ));
    ;
  }
}
