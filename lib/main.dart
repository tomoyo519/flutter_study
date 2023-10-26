import 'package:flutter/material.dart';

void main() {
  // 앱 시작해주세요.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white ,
          actions: [IconButton(icon: Icon(Icons.search) , onPressed:(){}, color: Colors.black,)
          ,IconButton(icon: Icon(Icons.menu) , onPressed:(){}, color: Colors.black,)
          ,IconButton(icon: Icon(Icons.doorbell) , onPressed:(){} , color: Colors.black,)],
          title:Row(
            children: [
              Text('금호동3가', style: TextStyle(color:(Colors.black), fontWeight: FontWeight.w700 )),
              IconButton(onPressed: (){}, icon: Icon(Icons.expand_more), color: Colors.black,)
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Row(

            crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Image.asset( "assets/wow.png", height: 120, width: 120,),
                SizedBox(
                  width: 250, height :250,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text("캐논 DSLR 100D (단렌즈, 충전기 16기가 SD 포함)", style: TextStyle(fontSize: 20),),
                        Text("성동구 행당동 끌올 10분전 ",),
                        Text("210,000원", style: TextStyle(fontWeight:FontWeight.w800)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:[
                            IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
                            Text("4")
                          ]

                        )

                      ],
                    ),
                  ),
                )
              ],
             ),
        ),


        bottomNavigationBar: BottomAppBar(child:SizedBox(
          height: 70,
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Icon(Icons.phone),
            Icon(Icons.message),
            Icon(Icons.contact_page)
          ],
    ),
        ),
      )
    )
    );
  }
}
