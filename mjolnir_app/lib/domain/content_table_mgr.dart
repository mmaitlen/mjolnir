import 'dart:math';

import 'package:mjolnir_app/dataobj/content.dart';
import 'package:mjolnir_app/dataobj/data_obj.dart';

class ContentMgr {

  static Map<String, List<String>> _contentTables = new Map();
  Map<String, ContentGenerationScript> _scriptMap = new Map();

  RollMgr _rollMgr;

  ContentWrapper generateContent(ContentRequest request) {
    return _scriptMap[request.name].execute();
  }

  registerContent(String contentType, List<String> contentList) {
    if (!_contentTables.containsKey(contentType)) {
      _contentTables[contentType] = new List();
    }
    _contentTables[contentType].addAll(contentList);
  }

  registerScript(ContentGenerationScript script) {
    _scriptMap[script.name] = script;
  }

  setRollMgr(RollMgr rollMgr) {
    this._rollMgr = rollMgr;
  }

  static String getContent(String contentType) {
    // TODO: get index from RollMgr so in can be mocked for testing
    return _contentTables[contentType][1];
  }
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
    dataObj.atrbMap[_atrbName] = ContentMgr.getContent(_contentType);
  }
}

class RollMgr {
  int roll(int min, int max) {
    Random r = new Random();
    return r.nextInt(max);
  }
}

class ContentWrapper {
  DataObj content;

  ContentWrapper(this.content);
}