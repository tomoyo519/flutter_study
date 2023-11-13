import 'package:flutter/material.dart';

void main() {
  //앱 시작해주세요.
  runApp(
      MaterialApp(
        home: MyApp()
      )
    );
}


class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
           showDialog(context:context, builder:(context){
             return Dialog(

                 child:
             Container(
               height:250,
               width: 250,
               padding: EdgeInsets.all(10),
               child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:[
                   Text("Contact",style: TextStyle(fontWeight: FontWeight.w800, fontSize:20) ,),
                   TextField(),
                   Row(

                       mainAxisAlignment: MainAxisAlignment.end,
                     children:[
                       ElevatedButton(onPressed: (){
                         Navigator.pop(context);
                       }, child: Text("Cancel")),
                       ElevatedButton(onPressed: (){}, child: Text("OK"))

                     ]


                   )

                 ]

               ),
             )
             );
           });
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.white ,
          actions: [IconButton(icon: Icon(Icons.search) , onPressed:(){}, color: Colors.black,)
          ,IconButton(icon: Icon(Icons.menu) , onPressed:(){}, color: Colors.black,)
          ,IconButton(icon: Icon(Icons.doorbell) , onPressed:(){} , color: Colors.black,)],
          title:Row(

          ),
        ),
        body: Text('')

      );


  }
}

