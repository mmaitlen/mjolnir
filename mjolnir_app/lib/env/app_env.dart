import 'package:mjolnir_app/env/data_mgr.dart';
import 'package:mjolnir_app/env/env.dart';
import 'package:mjolnir_app/env/screen_mgr.dart';
import 'package:mjolnir_app/ui/widget_mgr.dart';

class DevEnv extends Env {

  DevEnv() {
    registerManager(DATA_MGR_KEY, DevDataMgr());
    registerManager(SCREEN_MGR_KEY, ScreenMgr(WidgetMgr()));
  }

}