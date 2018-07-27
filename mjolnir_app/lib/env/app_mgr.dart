import 'package:mjolnir_app/common_dataobj.dart';
import 'package:mjolnir_app/env/data_mgr.dart';
import 'package:flutter/material.dart';
import 'package:mjolnir_app/ui/abtab/generate_content_screen.dart';

class AppMgr {

  BuildContext _context;
  DataMgr datamgr;


  AppMgr(this._context, this.datamgr);

  evoke(BuildContext context, Action action) {
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

//class Action {
//  BuildContext context;
//  String actionId;
//
//  Action(this.context, this.actionId);
//}


class Request {

}