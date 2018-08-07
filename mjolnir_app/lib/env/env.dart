import 'package:mjolnir_app/env/data_mgr.dart';

class Manager {}

const String DATA_MGR_KEY = "mgr-key-datamgr";
const String SCREEN_MGR_KEY = "mgr-key-screenmgr";

class Env {
  Map<String, Manager> _mgrMap = new Map();

  registerManager(String mgrKey, Manager mgr) {
    _mgrMap[mgrKey] = mgr;
  }

  Manager getManager(String mgrKey) {
    return _mgrMap[mgrKey];
  }

  DataMgr dataMgr() {
    return _mgrMap[DATA_MGR_KEY];
  }
}