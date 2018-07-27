import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mjolnir_app/common_dataobj.dart';
import 'package:mjolnir_app/dataobj/data_obj.dart';
import 'package:mjolnir_app/env/app_mgr.dart';

final TextStyle s1 = TextStyle(fontSize: 32.0);
final TextStyle s2 = TextStyle(fontSize: 28.0);
final TextStyle s3 = TextStyle(fontSize: 24.0);

class AppDelegate {
  static AppMgr appMgr;


}

class HomeScreen extends StatelessWidget {
  AppMgr _appMgr;
  String _title;
  String _publisherName = "Absolute Tabletop";
  String _publicationTitle = "Oath of the Frozen King";

  HomeScreen(this._appMgr, this._title) {
    AppDelegate.appMgr = _appMgr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AbTab - " + _title),
        actions: <Widget>[],
      ),
      body: ScreenBody(),
    );
  }
}

class MenuItemA extends Text {
  MenuItemA(String data) : super(data, style: TextStyle(fontSize: 24.0));
}

class MenuItem extends StatelessWidget {
  final String _data;

  MenuItem(this._data);

  report() {
    print("hi");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: InkWell(
            child: Text(_data, style: TextStyle(fontSize: 24.0, color: Colors.blue), textAlign: TextAlign.center),
            onTap: () => report()
        )
    );

  }

}

class ScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    obtainPublisher();

    return Container (
        padding: EdgeInsets.only(top: 32.0),
        child: Column(
          children: <Widget>[

            Text("Publisher Name", style: s1),
            Text('Publication Ttile', style: s2),
            Padding(padding: EdgeInsets.only(top: 16.0)),
            Expanded(
              child: new Container(
                child: ContentList(AppDelegate.appMgr.datamgr.getDataList())
              )
            ),
//            new FutureBuilder<List<DataObj>>(
//              future: getContent(),
//              builder: (BuildContext context, AsyncSnapshot<List<DataObj>> snapshot) {
//                switch (snapshot.connectionState) {
//                  case ConnectionState.none: return new Text('Press button to start');
//                  case ConnectionState.waiting: return new Text('Awaiting result...');
//                  default:
//                    if (snapshot.hasError)
//                      return new Text('Error: ${snapshot.error}');
//                    else
//                      return new ContentList(snapshot.data); //Text('Result: ${snapshot.data}');
//                }
//              },
//            )

          ],
        )
    );
  }
}


const publisher = 'bobdog';
const holdit = Duration(seconds: 5);

final dataStream = new Stream.periodic(holdit, (_) => publisher);

// Imagine that this function is more complex and slow. :)
Future<String> getPublishera() => dataStream.first;

String getPublisherb() => "abc";

obtainPublisher() async {
  String publisherName = await getPublishera();
  print(publisherName);

}


final contentStream = new Stream.periodic(holdit, (_) => publisher);

Future<List<DataObj>> getContent() async {
  return AppDelegate.appMgr.datamgr.getDataList();
}

class ContentList extends StatelessWidget {

  List<DataObj> _contentList;

  ContentList(this._contentList);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildList(context, _contentList),
    );
  }

  List<Widget> _buildList(BuildContext context, List<DataObj> data) {
    return data.map((dataObj) => new _ContentListItem(context, dataObj))
        .toList();
  }

}

class _ContentListItem extends ListTile {
  static final TextStyle s2 = TextStyle(fontSize: 28.0);

  BuildContext _ctx;

//  _ContentListItem(this._ctx) {
//    super();
//  }

  _ContentListItem(BuildContext ctx, DataObj dataObj) : super (
      title: Text(dataObj.getAtrb("text1").toString(), style: s3, textAlign: TextAlign.center),
      onTap: () {
        if (dataObj.hasAtrb(Action.ATRB_ACTION_TYPE)) {
          AppDelegate.appMgr.evoke(
              ctx, new Action.withContext(ctx, dataObj.getAtrbString(Action.ATRB_ACTION_TYPE), dataObj.getAtrbString(Action.ATRB_ACTION_TAG)));
        }
      }
  );

}