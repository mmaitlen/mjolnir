import 'package:flutter/material.dart';
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
            child: Text(_data, style: TextStyle(fontSize: 24.0, color: Colors.blue)),
            onTap: () => report()
        )
    );

  }

}

class ScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container (
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Center (
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Publisher Name", style: s1),
            Text('Publication Ttile', style: s2),
            Expanded(
              child: new Container(
                child: ContentList(AppDelegate.appMgr.datamgr.getDataList())
              )
            )

          ],
        )
    )
    );
  }
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
      title: Text(dataObj.getAtrb("text1").toString(), style: s3),
      onTap: () {
        AppDelegate.appMgr.evoke(ctx, new Action(ctx, dataObj.getAtrbString("actionId")));
      }
  );

}