import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mjolnir_app/dataobj/content.dart';
import 'package:mjolnir_app/dataobj/data_obj.dart';
import 'package:mjolnir_app/domain/content_table_mgr.dart';

import 'package:mjolnir_app/main.dart';

class MockRollMgr extends Mock implements RollMgr {}

void main() {

  const OBJTYPE_A1 = "a1";  // object type for SCRIPT to create
  const ATRB1 = "atrb1";  // attribute to fill for STEP
  const SCRIPT_AAA = "script-aaa";

  test('Initial content generation test', () {
    ContentMgr mgr = new ContentMgr();

    RollMgr rollMgr = MockRollMgr();
    ContentMgr.setRollMgr(rollMgr);

    const CONTENT_XYZ = "content-xyz";
    List<ContentEntry> contentList = new List();
    contentList.add(ContentEntry("aaa"));
    contentList.add(ContentEntry("bbb"));
    contentList.add(ContentEntry("ccc"));
    mgr.registerContent(CONTENT_XYZ, contentList);


    ContentGenerationScript script = new ContentGenerationScript(SCRIPT_AAA, OBJTYPE_A1);
    script.addStep(new ScriptStep(CONTENT_XYZ, ATRB1));
    mgr.registerScript(script);

    when(rollMgr.roll(0, 2)).thenReturn(1);

    ContentRequest request = new ContentRequest(SCRIPT_AAA);
    DataObj content = ContentMgr.generateContent(request).content;

    expect(content.getObjType(), OBJTYPE_A1);
    expect(content.getAtrbString(ATRB1), "bbb");
  });
}