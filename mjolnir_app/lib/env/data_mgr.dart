import 'package:mjolnir_app/common_dataobj.dart';
import 'package:mjolnir_app/dataobj/data_obj.dart';
import 'package:mjolnir_app/domain/content_loader.dart';

abstract class DataMgr {
  String getTitle();
  List<DataObj> getDataList();
}

class DevDataMgr extends DataMgr {

  @override
  String getTitle() {
    return "bobdog was here";
  }

  @override
  List<DataObj> getDataList() {
    List<DataObj> data = new List();
    data.add(_construct("Generate Character", "", "genchar"));
    data.add(_construct("Generate Encounter", "", "genenc"));
    data.add(_construct("Generate Monster", "", "genmonster"));
    data.add(_construct("Generate Loot", Action.ACTION_TYPE_GENERATE, ContentLoader.SCRIPT_AAA));
    data.add(_construct("Generate Who Done It", Action.ACTION_TYPE_GENERATE, ContentLoader.SCRIPT_WHO_DONE_IT));

    return data;
  }

  DataObj _construct(String data, String actionType, String actionTag) {
    DataObj dataObj = new DataObj("aaa");
    dataObj.addAtrb("text1", data);
    dataObj.addAtrb(Action.ATRB_ACTION_TYPE, actionType);
    dataObj.addAtrb(Action.ATRB_ACTION_TAG, actionTag);
    return dataObj;
  }
}