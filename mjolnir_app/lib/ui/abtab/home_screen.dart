import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mjolnir_app/common_dataobj.dart';
import 'package:mjolnir_app/dataobj/data_obj.dart';
import 'package:mjolnir_app/domain/content_loader.dart';
import 'package:mjolnir_app/env/app_mgr.dart';
import 'package:mjolnir_app/ui/abtab/generate_content_screen.dart';
import 'package:mjolnir_app/ui/widget_mgr.dart';

final TextStyle s1 = TextStyle(fontSize: 32.0);
final TextStyle s2 = TextStyle(fontSize: 28.0);
final TextStyle s3 = TextStyle(fontSize: 24.0);

class AppDelegate {
  static AppMgr appMgr;
}

class HomeScreen extends StatelessWidget {
  String _screenId;

  HomeScreen(this._screenId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: constructTitle(_screenId), actions: <Widget>[]),
        drawer: constructDrawer(context, _screenId),
        body: constructBody()
    );
  }

  Widget constructTitle(String screenId) {
    return Text(AppMgr.screenMgr().getScreenTitle(_screenId));
  }

  Widget constructDrawer(BuildContext context, String screenId) {
    return new Drawer(
        child: new ListView(
          children: <Widget> [
            new DrawerHeader(child: new Text('Header'),),
            new ListTile(
              title: new Text('First Menu Item'),
              onTap: () {
                print("tap first");
                Action action = new Action(Action.ACTION_TYPE_GENERATE, ContentLoader.SCRIPT_WHO_DONE_IT);

                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => GenerateContentScreen(action)));
              },
            ),
            new ListTile(
              title: new Text('Second Menu Item'),
              onTap: () {},
            ),
            new Divider(),
            new ListTile(
              title: new Text('About'),
              onTap: () {},
            ),
          ],
        )
    );
  }

  Widget constructBody() {
    return new FutureBuilder<List<WidgetInfo>>(
      future: fetchScreenBody(),
      builder:
          (BuildContext context, AsyncSnapshot<List<WidgetInfo>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return new Text('No content available');
          case ConnectionState.waiting:
            return new Text('Awaiting result...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return new ContentList(
                  snapshot.data, new DefaultActionHandler(context));
        }
      },
    );
  }
}

Future<List<WidgetInfo>> fetchScreenDrawer() async {
  return AppMgr.dataMgr().getDataList();
}

Future<List<WidgetInfo>> fetchScreenBody() async {
  return AppMgr.dataMgr().getDataList();
}



class DefaultActionHandler extends ActionHandler {
  BuildContext _context;

  DefaultActionHandler(this._context);

  @override
  handleWidgetClicked(DataObj dataObj) {
    if (dataObj.hasAtrb(Action.ATRB_ACTION_TYPE)) {
      AppMgr.evoke(
          _context,
          new Action.withContext(
              _context,
              dataObj.getAtrbString(Action.ATRB_ACTION_TYPE),
              dataObj.getAtrbString(Action.ATRB_ACTION_TAG)));
    }
  }
}

class ContentList extends StatelessWidget {
  List<DataObj> _contentList;
  ActionHandler _actionHandler;

  ContentList(this._contentList, this._actionHandler);

  @override
  Widget build(BuildContext context) {
//    return ListView(
//      children: _buildList(context, _contentList),
//    );

    return Container(
        child: Center(
            child: new Column(
      children: _buildList(context, _contentList),
    )));
  }

  List<Widget> _buildList(BuildContext context, List<WidgetInfo> dataList) {
    List<Widget> widgetList = new List<Widget>();
    dataList.forEach((widgetInfo) => widgetList.add(
        AppMgr.screenMgr().constructWidget(context, widgetInfo, _actionHandler)));

    return widgetList;
  }
}
