import 'package:flutter/material.dart';
import 'test_push_screen.dart';

void main(){
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: TrangChu()
    );
  }

}

class TrangChu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Test chuyen man hinh'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nhan nut de chuyen sang man hinh khac'),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ManHinh2('Nguyen Van B')));
              
            }, child: Icon(Icons.navigate_next))
          ],
        ),
      )
    );
  }

}