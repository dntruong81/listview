import 'package:flutter/material.dart';

void main() {
  runApp(MyAppNavigator());
}

class Routes {
  static String screen1 = '/screen1';
  static String screen2 = '/screen2';
  static String screen3 = '/screen3';
}

class MyAppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        /*routes: {
          '/screen1': (context) => ScreenTest1(),
          '/screen2': (context) => ScreenTest2(),
          Routes.screen3: (context) => ScreenTest3()
        }
        */

        onGenerateRoute: (settings) {
          if (settings.name == Routes.screen1)
            return MaterialPageRoute(settings:settings,builder: (context) => ScreenTest1());
           else if (settings.name == Routes.screen2)
            return MaterialPageRoute(settings:settings,builder: (context) => ScreenTest2());
          else
            return MaterialPageRoute(settings:settings,builder: (context) => ScreenTest3());
        },
        home: MyHomeScreen());
  }
}

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('My Home Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  Route route = MaterialPageRoute(
                      builder: (context) => ScreenTest1(
                            param: 'Hello Screen 1 ',
                          ));
                  final result = await Navigator.push(context, route);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(result)));
                },
                child: Text('Navigator cach 1')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context,'/screen2',arguments:'Man hinh thu 2');
                },
                child: Text('Navigator cach 2')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.screen3, arguments:'Hello Screen 2');
                },
                child: Text('Navigator cach 3'))
          ],
        ),
      ),
    );
  }
}

class ScreenTest1 extends StatelessWidget {
  final String? param;

  ScreenTest1({this.param});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Man hinh thu 1'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Gia tri nhan duoc: $param'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Gia tri tra ve tu man hinh 1');
                },
                child: Text('Quay ve')),
          ],
        ),
      ),
    );
  }
}

class ScreenTest2 extends StatelessWidget {
  final String? param;
  ScreenTest2({this.param});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final _param = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Man hinh thu 2'),
      ),
      body:Center(
        child: Column(
          children: [
            Text('Param: $_param'),
          ],
        ),
      )
    );
  }

}

class ScreenTest3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Man hinh thu 3'),
      ),
    );
  }
}
