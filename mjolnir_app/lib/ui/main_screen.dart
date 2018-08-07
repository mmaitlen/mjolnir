import 'package:flutter/material.dart';
import 'package:mjolnir_app/dataobj/data_obj.dart';
import 'package:mjolnir_app/env/app_mgr.dart';

class MainScreen extends StatelessWidget {


  String _title;

  MainScreen(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("aka " + _title),
        actions: <Widget>[
        ],
      ),
      body: ContentList(AppMgr.dataMgr().getDataList()),
    );
  }

}

class ContentList extends StatelessWidget {

  List<DataObj> _contentList;

  ContentList(this._contentList);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildList(_contentList),
    );
  }

  List<Widget> _buildList(List<DataObj> data) {
    return data.map((dataObj) => new _ContentListItem(dataObj))
        .toList();
  }

}

class _ContentListItem extends ListTile {

  _ContentListItem(DataObj dataObj) : super (
      title: Text(dataObj.atrbMap["text1"].toString())
  );
}
