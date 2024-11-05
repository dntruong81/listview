import 'package:flutter/material.dart';

void main() {
  runApp(MyDialog());
}

class MyDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        onGenerateRoute: (settings) {
          if (settings.name == '/myhomepage') {
            return MaterialPageRoute(
                settings: settings, builder: (context) => MyHomePage());
          }
        },
        home: MyDialogHome());
  }
}

class MyDialogHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyDialogHomeState();
  }
}

class MyDialogHomeState extends State<MyDialogHome> {
  TextEditingController _controller_username = TextEditingController();
  TextEditingController _controller_pass = TextEditingController();
  String? user_name;
  String? pass_word;

  void login() {
    user_name = _controller_username.text;
    pass_word = _controller_pass.text;
    if (user_name!.length < 6 || pass_word!.length < 6) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                content: Text('Username hoac pass khong hop le'));
          });
      return;
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(user_name!);
    if (!emailValid) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(content: Text('Email sai dinh dang'));
          });
      return;
    }
    Navigator.pushNamed(context, '/myhomepage', arguments: user_name!);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Test Dialog'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/dang_nhap.jpg',width: 100,height: 100,),
                TextField(
                  controller: _controller_username,
                  decoration: InputDecoration(hintText: 'Nhap email:'),
                ),
                TextField(
                  obscureText: true,
                  controller: _controller_pass,
                  decoration: InputDecoration(hintText: 'Nhap password:'),
                ),
                ElevatedButton(onPressed: login, child: Text('Login'))
              ],
            ),
          ),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final _user_name = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Login thanh cong'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User da longin: $_user_name'),
          ],
        ),
      ),
    );
  }
}
