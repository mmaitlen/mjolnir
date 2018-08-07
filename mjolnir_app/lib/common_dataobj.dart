import 'package:flutter/material.dart';
import 'package:mjolnir_app/dataobj/data_obj.dart';

class ScreenElement extends DataObj {

  static const OBJTYPE = "screen_element";

  static const ATRB_ACTION_TRIGGER = "action_trigger"; // id on click
  static const ATRB_ACTION_TYPE = Action.ATRB_ACTION_TYPE;
  static const ATRB_ACTION_ID = Action.ATRB_ACTION_TAG;

  ScreenElement(): super(OBJTYPE);

  registerAction(String trigger, String type, String id) {

  }
}

class Header extends DataObj {

  static const OBJTYPE = "header";

  Header(): super(OBJTYPE);
}

class Action extends DataObj {

  static const OBJTYPE = "action";

  static const ATRB_ACTION_TYPE = "action_type";
  static const ATRB_ACTION_TAG = "action_tag";
  static const ATRB_SCREEN_ID = "screen_id";

  // TODO this shouldn't be here, it's specific to the content, not the application
  static const ACTION_TYPE_GENERATE = "generate";
  static const ACTION_TYPE_NAVIGATION = "navigate";

  BuildContext buildContext;

  Action(String actionType, String actionTag): super(OBJTYPE) {
    addAtrb(ATRB_ACTION_TYPE, actionType);
    addAtrb(ATRB_ACTION_TAG, actionTag);
  }

  Action.withContext(BuildContext ctx, String actionType, String actionTag): super(OBJTYPE) {
    buildContext = ctx;
    addAtrb(ATRB_ACTION_TYPE, actionType);
    addAtrb(ATRB_ACTION_TAG, actionTag);
  }

}

class Request extends DataObj {

  static const OBJTYPE = "request";

  Request(): super(OBJTYPE);
}