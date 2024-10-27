import 'package:flutter/material.dart';

class GridViewScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('GridView Test')),
      body: SafeArea(
          child: Column(
            children: [
              Center(
                      child: Container(
              color: Colors.amber,
              width: 500,
              height: 250,
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                children: List.generate(6, (index) {
                  return Expanded(
                    child: (Card(
                      child: Center(
                        child: ListTile(
                          titleTextStyle:
                              TextStyle(fontSize: 10, color: Colors.red),
                          leading: Icon(Icons.home),
                          title: Text('Item: ${index * index}'),
                          //trailing: Icon(Icons.skip_next),
                        ),
                      ),
                    )),
                  );
                }),
              ),
                      ),
                    ),
            ],
          )),
    );
  }
}
