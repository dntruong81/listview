import 'dart:math';

import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<String> slDauVao = ['A', 'B'];
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Man hinh ListView'),
        ),
        body: SafeArea(
          child: Center(
              child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    height: 30,
                    color: Colors.yellow,
                    child: Center(
                      child: Text('Phan thu thu 1'),
                    ),
                  ),
                  Container(
                    height: 30,
                    color: Colors.green,
                    child: Center(
                      child: Text('Phan thu thu 2'),
                    ),
                  ),
                ],
              ),
              builListView2(),
              builListView3(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        counter++;
                        slDauVao.add(counter.toString());
                        setState(() {});
                      },
                      child: Text('Add item')),
                  ElevatedButton(
                      onPressed: () {
                        slDauVao.removeAt(0);
                        setState(() {});
                      },
                      child: Text('Delete item'))
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back))
            ],
          )),
        ));
  }

  Widget builListView2() {
    return Container(
      height: 100,
      child: (ListView.builder(
        shrinkWrap: true,
        itemCount: slDauVao.length,
        itemBuilder: (BuildContext context, int position) {
          return InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Vua bam vao Item: ${slDauVao[position]}'),
                duration: Duration(seconds: 1),
              ));
            },
            child: (Container(
              height: 30,
              /*color: Color.fromARGB(Random().nextInt(255), Random().nextInt(
                255),
            Random().nextInt(255), Random().nextInt(255)),*/
              child: Center(
                  child: Text(
                'Gia tri ${slDauVao[position]}',
              )),
            )),
          );
        },
      )),
    );
  }

  Widget builListView3() {
    return Container(
      height: 200,
      child: (ListView.separated(
        shrinkWrap: true,
        itemCount: slDauVao.length,
        itemBuilder: (BuildContext context, int position) {
          return (Container(
            height: 30,
            color: Color.fromARGB(Random().nextInt(255), Random().nextInt(255),
                Random().nextInt(255), Random().nextInt(255)),
            child: Center(
                child: Text(
              'Gia tri ${slDauVao[position]}',
            )),
          ));
        },
        separatorBuilder: (BuildContext context, int index) {
          return (Divider());
        },
      )),
    );
  }
}
