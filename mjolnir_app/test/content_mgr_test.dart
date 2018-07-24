import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mjolnir_app/dataobj/content.dart';
import 'package:mjolnir_app/dataobj/data_obj.dart';
import 'package:mjolnir_app/domain/content_table_mgr.dart';

import 'package:mjolnir_app/main.dart';

void main() {


  test('Initial content generation test', () {
    ContentMgr mgr = new ContentMgr();
    List<String> contentList = new List();
    contentList.add("aaa");
    contentList.add("bbb");
    contentList.add("ccc");
    const CONTENT_XYZ = "content-xyz";
    mgr.registerContent(CONTENT_XYZ, contentList);

    const SCRIPT_AAA = "script-aaa";

    const OBJTYPE_A1 = "a1";
    const ATRB1 = "atrb1";

    ContentGenerationScript script = new ContentGenerationScript(SCRIPT_AAA, OBJTYPE_A1);
    script.addStep(new ScriptStep(CONTENT_XYZ, ATRB1));
    mgr.registerScript(script);

    ContentRequest request = new ContentRequest(SCRIPT_AAA);
    DataObj content = mgr.generateContent(request).content;

    expect(content.getObjType(), OBJTYPE_A1);
    expect(content.getAtrbString(ATRB1), "bbb");
  });
}