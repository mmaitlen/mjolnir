import 'package:mjolnir_app/env/data_mgr.dart';
import 'package:flutter/material.dart';
import 'package:mjolnir_app/ui/abtab/generate_content_screen.dart';

class AppMgr {

  BuildContext _context;
  DataMgr datamgr;


  AppMgr(this._context, this.datamgr);

  evoke(BuildContext context, Action action) {
    print('tap ' + action.actionId);

    Navigator.push(context, MaterialPageRoute(builder: (context) => GenerateContentScreen(action)));
  }

  request(Request request) {

  }

}

class Action {
  BuildContext context;
  String actionId;

  Action(this.context, this.actionId);
}


class Request {

}