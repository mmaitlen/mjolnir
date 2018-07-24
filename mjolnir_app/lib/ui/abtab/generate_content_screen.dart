import 'package:flutter/material.dart';
import 'package:mjolnir_app/env/app_mgr.dart';

class GenerateContentScreen extends StatefulWidget {
  Action _action;
  GenerateContentScreen(this._action);

  @override
  _AboutPageState createState() => new _AboutPageState(_action);
}

void _navHome(BuildContext context) {
  Navigator.pop(context);
}

class _AboutPageState extends State<GenerateContentScreen> {
  Action _action;

  _AboutPageState(this._action);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('About'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text("Generate some content " + _action.actionId),
          onPressed: () => _navHome(context),
        ),
      ),
    );
  }
}


