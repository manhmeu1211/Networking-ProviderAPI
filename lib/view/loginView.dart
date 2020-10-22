import 'package:flutter/material.dart';
import 'package:simpleBaseAPI/models/login_model.dart';
import 'package:simpleBaseAPI/response/login_response.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passWord = TextEditingController();

  LoginModel a;

  bool _success;

  @override
  void initState() {
    super.initState();
  }


  void login() async {

    if (emailController.text.isEmpty || passWord.text.isEmpty) {
      return;
    }

    final email = emailController.text;
    final pass = passWord.text;

     a = await LoginRepository(params: {'email': email, 'password': pass})
        .login();

    setState(() {
      if (a.status == 1) {
        _success = true;
      } else {
        _success = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        backgroundColor: Colors.purple,
        // the App.build method, and use it to set our appbar title.
        title: Text("LOGIN"),
      ),
      body: Center(
        child: Center(
          child: Card(
            elevation: 5,
            child: Container(
              height: 210,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Email'),
                    controller: emailController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Password'),
                    controller: passWord,
                    obscureText: true,
                  ),
                  RaisedButton(
                    child: Text('Login'),
                    color: Colors.purple,
                    textColor: Colors.white,
                    onPressed: login,
                  ),
                  Text(
                    _success == null
                        ? ''
                        : (_success
                        ? 'Successfully signed in '
                        : 'Sign in failed'),
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
