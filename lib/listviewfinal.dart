import 'package:flutter/material.dart';

void main() {
  runApp(ListViewApp());
}

class ListViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (MaterialApp(home: ListViewAppPage()));
  }
}

class ListViewAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListViewAppPageSate();
  }
}

class ListViewAppPageSate extends State<ListViewAppPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView tinh'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
        children: [
          Text('ListView tinh'),
          ListViewTinh(),
          Text('ListView dong'),
          ListViewDong(),
        ],
      )),
    );
  }
}

Widget ListViewTinh() {
  return ListView(shrinkWrap: true, children: [
    Card(child: ListTile(title: Text('Nguyen Van A'))),
    Card(child: ListTile(title: Text('Nguyen Van B'))),
    Card(child: ListTile(title: Text('Nguyen Van C'))),
    Card(child: ListTile(title: Text('Tran Van Ven'))),
  ]);
}

Widget ListViewDong() {
  int n = 5;
  List<int> listSo = List.generate(n, (i) => i * i);
  return ListView.builder(
      shrinkWrap: true,
      itemCount: n,
      itemBuilder: (BuildContext context, i) => Card(
              child: ListTile(
            title: Text('Phan tu ${listSo[i]}'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(duration: Duration(milliseconds: 100),content: Text('Phan tu ${listSo[i]}')));
            },
          )));
}
