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
        routes: {
          Routes.screen1: (context) => ScreenTest1(),
          Routes.screen2: (context) => ScreenTest2(),
         // Routes.screen3: (context) => ScreenTest3()
        },
         onGenerateRoute: (settings) {
          /* switch (settings.name){
            case ('/screen1'):
              return MaterialPageRoute(builder: (context) => ScreenTest1());
              break;
              case ('/screen2'):
                return MaterialPageRoute(builder: (context) => ScreenTest2());
                break;
            case ('/screen3'):
              return MaterialPageRoute(builder: (context) => ScreenTest3());
              break;
          }*/
          if (settings.name == Routes.screen1) {
            return MaterialPageRoute(builder: (context) => ScreenTest1());
          } else if (settings.name == Routes.screen2)
            return MaterialPageRoute(builder: (context) => ScreenTest2());
          else
            return MaterialPageRoute(builder: (context) => ScreenTest3());
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
                  Route route =
                      MaterialPageRoute(builder: (context) => ScreenTest1());
                  final result = await Navigator.push(context, route);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
                },
                child: Text('Navigator cach 1')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.screen2);
                },
                child: Text('Navigator cach 2')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.screen3);
                },
                child: Text('Navigator cach 3'))
          ],
        ),
      ),
    );
  }
}

class ScreenTest1 extends StatelessWidget {
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
            ElevatedButton(onPressed: (){
              Navigator.pop(context,'Gia tri tra ve tu man hinh 1');
            }, child: Text('Quay ve')),
          ],
        ),
      ),
    );
  }
}

class ScreenTest2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Man hinh thu 2'),
      ),
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
