import 'dart:math';

import 'package:mjolnir_app/dataobj/content.dart';
import 'package:mjolnir_app/dataobj/data_obj.dart';

class ContentMgr {

  static RollMgr _rollMgr;
  static Map<String, List<ContentEntry>> _contentTables = new Map();
  static Map<String, ContentGenerationScript> _scriptMap = new Map();


  static ContentWrapper generateContent(ContentRequest request) {
    return _scriptMap[request.name].execute();
  }

  registerContent(String contentType, List<ContentEntry> contentList) {
    if (!_contentTables.containsKey(contentType)) {
      _contentTables[contentType] = new List();
    }
    _contentTables[contentType].addAll(contentList);
  }

  registerScript(ContentGenerationScript script) {
    _scriptMap[script.name] = script;
  }

  static getRollMgr() {
    if (_rollMgr == null) {
      _rollMgr = RollMgr();
    }
    return _rollMgr;
  }

  static setRollMgr(RollMgr rollMgr) {
    _rollMgr = rollMgr;
  }

  static ContentEntry getContent(String contentType) {
    List<ContentEntry> contentTable = _contentTables[contentType];
    int min = 0;
    int max = contentTable.length - 1;
    int roll = getRollMgr().roll(min, max);
    print("ContentTableMgr.getContent type $contentType tbl min $min max $max roll $roll");
    return contentTable[roll];
  }

//  static ContentEntry getWeightedContent(String contentType) {
//    // TODO: need means to select weighted contennt
//    List<ContentEntry> contentTable = _contentTables[contentType];
//    contentTable.forEach((entry) => {
//
//    });
//  }
}


class ContentEntry {

  // TODO: need to have a means to specify rarity table
  static const WEIGHT_COMMON = "common";
  static const WEIGHT_RARE = "rare";
  static const WEIGHT_VERYRARE = "veryrare";

  String value;
  String weight;

  ContentEntry(this.value);
}

class ContentRequest {

  String name;

  ContentRequest(this.name) {

  }
}

class ContentGenerationScript {
  String name;
  String _objType;
  List<ScriptStep> _steps = new List();

  ContentGenerationScript(this.name, this._objType);

  ContentWrapper execute() {
    DataObj dataObj = new DataObj(_objType);

    _steps.forEach((step) => step.executeStep(dataObj));

    return ContentWrapper(dataObj);
  }

  addStep(ScriptStep step) {
    _steps.add(step);
  }

}

class ScriptStep {

  String _contentType;
  String _atrbName;

  ScriptStep(this._contentType, this._atrbName);

  executeStep(DataObj dataObj) {
    ContentEntry content = ContentMgr.getContent(_contentType);
    dataObj.atrbMap[_atrbName] = content.value;
  }
}

class RollMgr {
  int roll(int min, int max) {
    print("RollMgr.roll min $min max $max");
    Random r = new Random();
    return r.nextInt(max);
  }
}

class ContentWrapper {
  DataObj content;

  ContentWrapper(this.content);
}