library angular.dart.effects.css;

import 'dart:html';
import 'package:angular/angular.dart';

class CssUtilsModule extends Module {
  CssUtilsModule(){
    bind(CssUtils);
  }
}

@Injectable()
class CssUtils {
  LinkElement styleSheet(String id, String styles) {
    LinkElement el = new LinkElement();
    el.id = id;
    el.rel = 'stylesheet';
    el.href = 'data:text/css, $styles';

    return el;
  }
}