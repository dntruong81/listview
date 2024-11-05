import 'package:flutter/material.dart';

class ManHinh2 extends StatelessWidget {
  String mess = '';
  ManHinh2(this.mess);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Man hinh thu 2'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Man hinh thu 2'),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Quay ve')),
            Text('Tham so nhan duoc: $mess'),
          ]
        ),
      ),
    );
  }


}

