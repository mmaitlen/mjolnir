import 'package:flutter/material.dart';
import 'package:mjolnir_app/dataobj/data_obj.dart';
import 'package:mjolnir_app/domain/content_loader.dart';
import 'package:mjolnir_app/domain/content_table_mgr.dart';
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

const TextStyle s2 = TextStyle(fontSize: 28.0);

class _AboutPageState extends State<GenerateContentScreen> {

  Action _action;
//  DataObj content;

  _AboutPageState(this._action) {
    ContentLoader.loadAlpha();
    ContentLoader.loadMysteryContent();

//    ContentRequest request = new ContentRequest(ContentLoader.SCRIPT_WHO_DONE_IT);
//    content = ContentMgr.generateContent(request).content;
  }



  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('About'),
      ),
      body:
      Container (
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          child: Center (
              child: ContentGenerationWidget()
          )
      )
    );
  }

}

class ContentGenerationWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ContentGenerationState();

}

class _ContentGenerationState extends State<ContentGenerationWidget> {

  String _content;

  _generateContent() {
    ContentRequest request = new ContentRequest(ContentLoader.SCRIPT_WHO_DONE_IT);
    DataObj data = ContentMgr.generateContent(request).content;

    setState(() {
      _content = "Who Done It? It was ${data.getAtrbString(ContentLoader.ATRB_PERSON)} "
          "in ${data.getAtrbString(ContentLoader.ATRB_PLACE)} "
          "with ${data.getAtrbString(ContentLoader.ATRB_WEAPON)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new InkWell(
            child: new Text("Press me to find out Who Done It!"),
            onTap: _generateContent),
        new Text("$_content", style: s2)
      ]
    );
  }

}

