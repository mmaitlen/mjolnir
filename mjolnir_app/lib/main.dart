import 'package:flutter/material.dart';
import 'package:mjolnir_app/env/app_mgr.dart';
import 'package:mjolnir_app/env/data_mgr.dart';
import 'package:mjolnir_app/res/strings.dart';
import 'package:mjolnir_app/ui/abtab/home_screen.dart';

void main() {
  runApp(new MainApp());
}


class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        title: Strings.appname, // + AppMgr.of(context).datamgr.getTitle(),
        home: new HomeScreen(AppMgr(context, DevDataMgr()), Strings.appname)
    );
  }
}

