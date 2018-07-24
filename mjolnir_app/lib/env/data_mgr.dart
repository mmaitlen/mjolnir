import 'package:mjolnir_app/dataobj/data_obj.dart';

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
    data.add(_construct("Generate Character", "genchar"));
    data.add(_construct("Generate Encounter", "genenc"));
    data.add(_construct("Generate Monster", "genmonster"));
    data.add(_construct("Generate Loot", "genloot"));
    return data;
  }

  DataObj _construct(String data, String actionId) {
    DataObj dataObj = new DataObj("aaa");
    dataObj.addAtrb("text1", data);
    dataObj.addAtrb("actionId", actionId);
    return dataObj;
  }
}