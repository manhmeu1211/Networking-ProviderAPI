import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:simpleBaseAPI/response/news_response.dart';
import 'package:simpleBaseAPI/view/loginView.dart';
import '../blocs/news_bloc.dart';
import '../response/login_response.dart';

class NewsTitleView extends StatefulWidget {
  @override
  _NewsTitleViewState createState() => _NewsTitleViewState();
}

class _NewsTitleViewState extends State<NewsTitleView> {
  NewsBloc _bloc;
  NewsRepository _res;

  @override
  void initState() {
    super.initState();
    _bloc = NewsBloc();
    _res = NewsRepository();
  }

  void getData() {
    _res.fetchProducts();
  }

  void handleLogin() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RaisedButton(
            child: Text("News"),
            color: Colors.purple,
            textColor: Colors.white,
            onPressed: getData,
          ),
          RaisedButton(
            child: Text("Login"),
            color: Colors.amber,
            onPressed: handleLogin,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
