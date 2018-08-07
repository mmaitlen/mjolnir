import 'package:flutter/material.dart';
import 'package:mjolnir_app/env/app_env.dart';
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

    AppMgr.setEnv(new DevEnv());

    return new MaterialApp(
        title: Strings.appname,
        home: new HomeScreen(Strings.appname)
    );
  }
}

