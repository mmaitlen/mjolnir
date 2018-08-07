import 'dart:ui';

import 'package:mjolnir_app/common_dataobj.dart';
import 'package:mjolnir_app/dataobj/data_obj.dart';
import 'package:mjolnir_app/domain/content_loader.dart';
import 'package:mjolnir_app/env/env.dart';
import 'package:mjolnir_app/env/screen_mgr.dart';
import 'package:mjolnir_app/ui/widget_mgr.dart';

abstract class DataMgr extends Manager {
  String getTitle();
  List<WidgetInfo> getDataList();

  ScreenInfo getScreenInfo(String screenId);
}

class DevDataMgr extends DataMgr {


  @override
  ScreenInfo getScreenInfo(String screenId) {
    // TODO: implement getScreenInfo
    ScreenInfo screenInfo = ScreenInfo();
    return screenInfo;
  }

  @override
  String getTitle() {
    return "bobdog was here";
  }

  @override
  List<WidgetInfo> getDataList() {
    List<WidgetInfo> data = new List();
//    data.add(new Header());
    data.add(_constructSpacer(60.0));
    data.add(_constructUrlLink("AbTab", "https://absolutetabletop.com"));
    data.add(_constructSpacer(30.0));
    data.add(_constructTextCentered("Generate Character", "", "genchar"));
    data.add(_constructTextCentered("Generate Encounter", "", "genenc"));
    data.add(_constructTextCentered("Generate Monster", "", "genmonster"));
    data.add(_constructTextCentered("Generate Loot", Action.ACTION_TYPE_GENERATE, ContentLoader.SCRIPT_AAA));
    data.add(_constructTextCentered("Generate Who Done It", Action.ACTION_TYPE_GENERATE, ContentLoader.SCRIPT_WHO_DONE_IT));

    return data;
  }

  @override
  List<DataObj> getScreenContent(Request request) {
    List<DataObj> data = new List();
    return data;
  }

  WidgetInfo _constructSpacer(double height) {
    WidgetInfo widgetInfo = new WidgetInfo(WidgetMgr.WIDGET_TYPE_SPACER);
    widgetInfo.addAtrb("height", height);
    return widgetInfo;
  }

  WidgetInfo _constructUrlLink(String text, String url) {
    WidgetInfo widgetInfo = new WidgetInfo(WidgetMgr.WIDGET_TYPE_URL_LINK);
    widgetInfo.addAtrb("text", text);
    widgetInfo.addAtrb("url", url);
    return widgetInfo;
  }

  WidgetInfo _constructTextCentered(String data, String actionType, String actionTag) {
    WidgetInfo widgetInfo = _construct(data, actionType, actionTag, WidgetMgr.WIDGET_TYPE_TEXT);
    widgetInfo.addAtrb("alignment", TextAlign.center);
    return widgetInfo;
  }

  WidgetInfo _constructText(String data, String actionType, String actionTag) {
    return _construct(data, actionType, actionTag, WidgetMgr.WIDGET_TYPE_TEXT);
  }

  WidgetInfo _construct(String data, String actionType, String actionTag, String widgetType) {
    WidgetInfo dataObj = new WidgetInfo(widgetType);
    dataObj.addAtrb("text", data);
    dataObj.addAtrb(Action.ATRB_ACTION_TYPE, actionType);
    dataObj.addAtrb(Action.ATRB_ACTION_TAG, actionTag);
    return dataObj;
  }



}