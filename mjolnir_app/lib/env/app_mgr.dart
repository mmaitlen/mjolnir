import 'package:mjolnir_app/common_dataobj.dart';
import 'package:mjolnir_app/env/data_mgr.dart';
import 'package:flutter/material.dart';
import 'package:mjolnir_app/env/env.dart';
import 'package:mjolnir_app/env/screen_mgr.dart';
import 'package:mjolnir_app/ui/abtab/generate_content_screen.dart';

class AppMgr {

  static Env _env;

  AppMgr();

  static setEnv(Env env) {
    _env = env;
  }

  static Manager getManager(String mgrKey) {
    return _env.getManager(mgrKey);
  }

  static DataMgr dataMgr() {
    return getManager(DATA_MGR_KEY);
  }

  static ScreenMgr screenMgr() {
    return getManager(SCREEN_MGR_KEY);
  }

  static evoke(BuildContext context, Action action) {
    String type = action.getAtrbString(Action.ATRB_ACTION_TYPE);
    print('tap type ${type} id ${action.getAtrbString(Action.ATRB_ACTION_TAG)}');
    switch(type) {
      case(Action.ACTION_TYPE_GENERATE):
        Navigator.push(context, MaterialPageRoute(builder: (context) => GenerateContentScreen(action)));
        break;
    }
  }

  request(Request request) {

  }

}
