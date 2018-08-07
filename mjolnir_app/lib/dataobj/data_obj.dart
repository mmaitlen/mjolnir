import 'package:uuid/uuid.dart';

class DataObj {

  static final Uuid _uuid = Uuid();

  static const String ATRB_OBJTYPE = "objtype";
  static const String ATRB_OBJID = "objid";
  static const String ATRB_NAME = "name";

  Map<String, Object> atrbMap = new Map();

  DataObj(String type) {
    atrbMap[ATRB_OBJTYPE] = type;
    atrbMap[ATRB_OBJID] = _uuid.v1();
  }

  addAtrb(String atrbKey, Object value) {
    atrbMap[atrbKey] = value;
  }

  Object getAtrb(String atrbKey, {Object defaultValue}) {
    if (hasAtrb(atrbKey)) {
      return atrbMap[atrbKey];
    } else {
      return defaultValue;
    }
  }

  String getObjType() {
    return getAtrbString(ATRB_OBJTYPE);
  }

  String getAtrbString(String atrbKey) {
    return atrbMap[atrbKey].toString();
  }

  bool hasAtrb(String atrbKey) {
    return atrbMap.containsKey(atrbKey);
  }

  bool isType(String type) {
    return getAtrbString(ATRB_OBJTYPE) == type;
  }

  bool isAtrbEqualTo(String atrbKey, String value) {
    return hasAtrb(atrbKey) && getAtrb(atrbKey) == value;
  }
}