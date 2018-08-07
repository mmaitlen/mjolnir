import 'package:flutter/material.dart';
import 'package:mjolnir_app/dataobj/data_obj.dart';
import 'package:mjolnir_app/env/env.dart';
import 'package:mjolnir_app/ui/widget_mgr.dart';

class ScreenMgr extends Manager {

  WidgetMgr _widgetMgr;

  ScreenMgr(this._widgetMgr);

  String getScreenTitle(String screenId) {
    return "gigglesnort 333";
  }

  Widget constructWidget(BuildContext context, WidgetInfo widgetInfo, ActionHandler actionHandler) {
    return _widgetMgr.getWidget(context, widgetInfo, actionHandler);
  }
}


class ScreenInfo extends DataObj {
  static const OBJTYPE = "screen_info";

  List<WidgetInfo> screenContents;

  ScreenInfo(): super(OBJTYPE) {
    addAtrb("title", "this is a title");
  }

  List<WidgetInfo> getScreenContents() {
    screenContents = List();
    WidgetInfo widgetInfo1 = WidgetInfo(WidgetMgr.WIDGET_TYPE_TEXT);
    widgetInfo1.addAtrb("text", "gigglesnort abc");
    WidgetInfo widgetInfo2 = WidgetInfo(WidgetMgr.WIDGET_TYPE_TEXT);
    widgetInfo2.addAtrb("text", "bobis dogis");
    screenContents.add(widgetInfo1);
    screenContents.add(widgetInfo2);

    return screenContents;
  }
}