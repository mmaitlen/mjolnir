import 'package:mjolnir_app/domain/content_table_mgr.dart';

class ContentLoader {

  static const OBJTYPE_A1 = "a1";  // object type for SCRIPT to create
  static const ATRB1 = "atrb1";  // attribute to fill for STEP
  static const SCRIPT_AAA = "script-aaa";

  static loadAlpha() {
    ContentMgr mgr = new ContentMgr();

    const CONTENT_XYZ = "content-xyz";
    List<ContentEntry> contentList = new List();
    contentList.add(ContentEntry("aaa"));
    contentList.add(ContentEntry("bbb"));
    contentList.add(ContentEntry("ccc"));
    mgr.registerContent(CONTENT_XYZ, contentList);



    ContentGenerationScript script = new ContentGenerationScript(SCRIPT_AAA, OBJTYPE_A1);
    script.addStep(new ScriptStep(CONTENT_XYZ, ATRB1));
    mgr.registerScript(script);
  }


  static const OBJTYPE_WHODONEIT = "who_done_it";  // object type for SCRIPT to create
  static const ATRB_PERSON = "person";
  static const ATRB_PLACE = "place";
  static const ATRB_WEAPON = "weapon";
  static const CONTENT_PERSON = "content-person";
  static const CONTENT_PLACE = "content-place";
  static const CONTENT_WEAPON = "content-weapon";
  static const SCRIPT_WHO_DONE_IT = "script-who-done-it";


  static loadMysteryContent() {
    ContentMgr mgr = new ContentMgr();

    {
      List<ContentEntry> contentPerson = new List();
      contentPerson.add(ContentEntry("the Butler"));
      contentPerson.add(ContentEntry("the Cook"));
      contentPerson.add(ContentEntry("Mr. Gravias"));
      contentPerson.add(ContentEntry("Miss Tweeters"));
      contentPerson.add(ContentEntry("Lt. Hendricks"));
      contentPerson.add(ContentEntry("the Twins"));
      contentPerson.add(ContentEntry("Mrs. Renyolds"));
      contentPerson.add(ContentEntry("Mister Friskies"));
      mgr.registerContent(CONTENT_PERSON, contentPerson);
    }

    {
      List<ContentEntry> contentPlace = new List();
      contentPlace.add(ContentEntry("the Library"));
      contentPlace.add(ContentEntry("the Back Yard"));
      contentPlace.add(ContentEntry("the Bedroom"));
      contentPlace.add(ContentEntry("the Kitchen"));
      contentPlace.add(ContentEntry("the Livingroom"));
      contentPlace.add(ContentEntry("the Bathroom"));
      contentPlace.add(ContentEntry("the Pantry"));
      contentPlace.add(ContentEntry("the Obversitory"));
      contentPlace.add(ContentEntry("the Garage"));
      mgr.registerContent(CONTENT_PLACE, contentPlace);
    }

    {
      List<ContentEntry> contentWeapon = new List();
      contentWeapon.add(ContentEntry("a Wet Noodle"));
      contentWeapon.add(ContentEntry("a Broom Stick"));
      contentWeapon.add(ContentEntry("a Candlestick"));
      contentWeapon.add(ContentEntry("a Machette"));
      contentWeapon.add(ContentEntry("a Long Sword"));
      contentWeapon.add(ContentEntry("a Dagger"));
      contentWeapon.add(ContentEntry("a Yard Spike"));
      contentWeapon.add(ContentEntry("a Tire Iron"));
      contentWeapon.add(ContentEntry("a Bowling Ball"));
      contentWeapon.add(ContentEntry("a Kettlebell"));
      contentWeapon.add(ContentEntry("a Dead Cat"));
      mgr.registerContent(CONTENT_WEAPON, contentWeapon);
    }


    ContentGenerationScript script = new ContentGenerationScript(SCRIPT_WHO_DONE_IT, OBJTYPE_WHODONEIT);
    script.addStep(new ScriptStep(CONTENT_PERSON, ATRB_PERSON));
    script.addStep(new ScriptStep(CONTENT_PLACE, ATRB_PLACE));
    script.addStep(new ScriptStep(CONTENT_WEAPON, ATRB_WEAPON));
    mgr.registerScript(script);
  }
}

