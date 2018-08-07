import 'package:flutter/material.dart';
import 'package:mjolnir_app/dataobj/data_obj.dart';
import 'package:url_launcher/url_launcher.dart';


class WidgetMgr {

  static const String WIDGET_TYPE_HEADER = "header";
  static const String WIDGET_TYPE_TEXT = "text";
  static const String WIDGET_TYPE_URL_LINK = "url_link";
  static const String WIDGET_TYPE_SPACER = "spacer";

  WidgetRouter _widgetRouter = WidgetRouter();

  Widget getWidget(BuildContext context, WidgetInfo widgetInfo, ActionHandler actionHandler) {
    return _widgetRouter.getWidget(context, widgetInfo, actionHandler);
  }

  //Properties properties (text is a property...can action stuff also be a prop?), ActionInfo actionInfo  (actioninfo = NAV_ACTION, "/screenid/somescreenId"
  WidgetInfo constructText(String text, String actionType, String actionTag) {
    return null;
  }
}

abstract class ActionHandler {
  handleWidgetClicked(DataObj dataObj);
}

class WidgetRouter {
  Widget getWidget(BuildContext context, WidgetInfo widgetInfo, ActionHandler actionHandler) {
    switch(widgetInfo.getWidgetType()) {
      case WidgetMgr.WIDGET_TYPE_TEXT:
        return ClickableTextWidget(widgetInfo, actionHandler);
        break;
      case WidgetMgr.WIDGET_TYPE_URL_LINK:
        return UrlLink(widgetInfo);
        break;
      case WidgetMgr.WIDGET_TYPE_SPACER:
        return new Container(height: widgetInfo.getAtrb("height"));
        break;
    }
    return null;
  }
}

class WidgetInfo extends DataObj {
  static const OBJTYPE = "widget_info";
  static const ATRB_WIDGET_TYPE = "widget_type";

  WidgetInfo(String widgetType) : super(OBJTYPE) {
    addAtrb(ATRB_WIDGET_TYPE, widgetType);  
  }

  String getWidgetType() => getAtrbString(ATRB_WIDGET_TYPE);

  bool isWidgetType(String widgetType) {
    return getWidgetType() == widgetType;
  }
}


class Header extends DataObj {

  static const OBJTYPE = "widget_header";

  Header(): super(OBJTYPE);
}

const TextStyle DEFAULT_TEXT = TextStyle(fontSize: 28.0);

class _ContentListItem extends ListTile {


  _ContentListItem(BuildContext ctx, DataObj dataObj) : super (

      title: Text(dataObj.getAtrbString("text"), style: DEFAULT_TEXT, textAlign: dataObj.getAtrb("alignment", defaultValue: TextAlign.start)),
      onTap: () {
//        if (dataObj.hasAtrb(Action.ATRB_ACTION_TYPE)) {
//          AppMgr.evoke(
//              ctx, new Action.withContext(ctx, dataObj.getAtrbString(Action.ATRB_ACTION_TYPE), dataObj.getAtrbString(Action.ATRB_ACTION_TAG)));
//        }
      }
  );

}

class ListSpacer extends ListTile {
  ListSpacer(BuildContext ctx, DataObj dataObj) : super (
    contentPadding: EdgeInsets.only(top: 60.0)
  );
}

class ClickableTextWidget extends StatelessWidget {

  String _text;
  ActionHandler _actionHandler;
  WidgetInfo _widgetInfo;

  ClickableTextWidget(this._widgetInfo, this._actionHandler) {
    _text = _widgetInfo.getAtrbString("text");
  }

  _handleClick() async {
    _actionHandler.handleWidgetClicked(_widgetInfo);

  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleClick,
      child: Container(
        height: 60.0,
        width: 300.0,
        child: Center(
          child: Text(
              _widgetInfo.getAtrbString("text"),
              style: DEFAULT_TEXT,
              textAlign: _widgetInfo.getAtrb("alignment", defaultValue: TextAlign.start)
          ),
        ),
      ),
    );
  }
}

class UrlLink extends StatelessWidget {

  String _text;
  String _url;


  UrlLink(WidgetInfo widgetInfo) {
    _text = widgetInfo.getAtrbString("text");
    _url = widgetInfo.getAtrbString("url");
  }

  _launchURL() async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }

  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Container(
        child: Center(
          child: Text(
            _text,
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 120.0,
        height: 60.0,
        decoration: BoxDecoration(
            color: Colors.teal
        ),
      ),
    );
  }
}
