
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget{
  String item ='';
  DetailScreen( {required this.item});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Man hinh chi tiet'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Da nhan vao: $item'),
          ],
        ),
      ),
    );
  }


}