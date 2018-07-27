import 'package:flutter/material.dart';
import 'package:mjolnir_app/common_dataobj.dart';
import 'package:mjolnir_app/dataobj/data_obj.dart';
import 'package:mjolnir_app/domain/content_loader.dart';
import 'package:mjolnir_app/domain/content_table_mgr.dart';
import 'package:mjolnir_app/env/app_mgr.dart';

class GenerateContentScreen extends StatefulWidget {
  Action _action;

  GenerateContentScreen(this._action);

  @override
  _ContentPageState createState() => new _ContentPageState(_action);
}

const TextStyle s1 = TextStyle(fontSize: 20.0);
const TextStyle s2 = TextStyle(fontSize: 28.0);

class _ContentPageState extends State<GenerateContentScreen> {
  static Action _action;

  _ContentPageState(Action action) {
    _action = action;
    ContentLoader.loadAlpha();
    ContentLoader.loadMysteryContent();

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Generator'),
        ),
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0),
            child: Center(child: ContentGenerationWidget())));
  }
}

class ContentGenerationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContentGenerationState();
}

class _ContentGenerationState extends State<ContentGenerationWidget> {
  String _content = "?";

  _generateContent() {
    ContentRequest request =
        new ContentRequest(_ContentPageState._action.getAtrbString(Action.ATRB_ACTION_TAG));
    DataObj data = ContentMgr.generateContent(request).content;

    setState(() {
      if (_ContentPageState._action.getAtrbString(Action.ATRB_ACTION_TAG) == ContentLoader.SCRIPT_WHO_DONE_IT) {
        _content = "It was ${data.getAtrbString(ContentLoader.ATRB_PERSON)} "
            "in ${data.getAtrbString(ContentLoader.ATRB_PLACE)} "
            "with ${data.getAtrbString(ContentLoader.ATRB_WEAPON)}";
      } else {
        _content = "abc ${data.getAtrbString(ContentLoader.ATRB1)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      new Container(
          width: 220.0,
          margin: new EdgeInsets.all(16.0),
          color: Colors.grey,
          padding: EdgeInsets.all(8.0),
          child: InkWell(
              child: new Text(
                "Who Done It?",
                style: s2,
                textAlign: TextAlign.center,
              ),
              onTap: _generateContent)),
      new Container(
          margin: new EdgeInsets.all(16.0),
          child: Text("$_content", style: s1, textAlign: TextAlign.center,))
    ]);
  }
}
