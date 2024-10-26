import 'dart:math';

import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<String> slDauVao = ['A', 'B', 'C', 'D'];
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
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      height: 50,
                      color: Colors.yellow,
                      child: Center(
                        child: Text('Phan thu thu 1'),
                      ),
                    ),
                    Container(
                      height: 50,
                      color: Colors.green,
                      child: Center(
                        child: Text('Phan thu thu 2'),
                      ),
                    ),
                    Container(
                      height: 50,
                      color: Colors.red,
                      child: Center(
                        child: Text('Phan thu thu 3'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              builListView2(),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    counter ++;
                    slDauVao.add(counter.toString());
                    setState(() {

                    });
                  },
                      child: Text('Add item')),
                  ElevatedButton(onPressed: (){
                    slDauVao.removeAt(0);
                    setState(() {

                    });
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
      height: 200,
      child: (ListView.builder(
        shrinkWrap: true,
        itemCount: slDauVao.length,
        itemBuilder: (BuildContext context, int position) {
          return (Container(
            height: 50,
            color: Color.fromARGB(Random().nextInt(255), Random().nextInt(255),
                Random().nextInt(255), Random().nextInt(255)),
            child: Center(
                child: Text(
              'Gia tri ${slDauVao[position]}',
            )),
          ));
        },
      )),
    );
  }
}
