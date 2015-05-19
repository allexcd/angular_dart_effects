library angular.dart.effects.ripple;

import 'dart:html';
import 'dart:math' as Math;
import 'package:angular/angular.dart';
import 'package:logging/logging.dart' show Logger;
import 'package:angular_dart_effects/utils/types_utils.dart';
import 'package:angular_dart_effects/utils/css_utils.dart';
import 'package:angular_dart_effects/utils/css_effect_styles.dart';

/**
 * Ripple Effect Module
 */
class RippleEffectDecoratorModule extends Module {
  RippleEffectDecoratorModule() {
    bind(RippleEffectDecorator);
    install(new TypesUtilsModule());
    install(new CssUtilsModule());
    install(new CssEffectStylesModule());
  }
}

@Decorator(
    selector: '[ripple-effect]'
)
class RippleEffectDecorator implements AttachAware {
  final Logger _log = new Logger('angular.dart.effects.ripple');
  final Element _element;
  final Types _utils;
  final CssUtils _cssUtils;
  final CssEffectStyles _cssEffectStyles;
  String _rippleBg;
  String _rippleSpeed;

  void _ripple(SpanElement span) {
    Element ripple, newRipple;
    int size;
    double x, y;
    var clientRect;

    span.onClick.listen((event) {
      _log.info('init ripple effect');

      newRipple = new Element.tag('span');
      newRipple.classes.add("ripple");

      if (span.querySelector(".ripple") == null) {
        span.children.add(newRipple);
      }

      ripple = span.querySelector(".ripple");
      ripple.classes.remove("animate");

      if (!_utils.toBool(ripple.offsetHeight) && !_utils.toBool(ripple.offsetWidth)) {
        size = Math.max(span.offsetWidth, span.offsetHeight);
        ripple.style.height = "${size}px";
        ripple.style.width = "${size}px";
      }

      clientRect = span.getBoundingClientRect();

      //event.clientX, event.clientY not working on mobile webkit. use event.page.x, event.page.y instead
      x = (event.page.x - clientRect.left) - (ripple.offsetWidth / 2);
      y = (event.page.y - clientRect.top) - (ripple.offsetHeight / 2);

      ripple.style.top = "${y}px";
      ripple.style.left = "${x}px";

      ripple.classes.add("animate");
    });
  }

  void _transclude() {
    //get element's content (nodes -> it means everything an element contains, including comments)
    List nodes = _element.nodes;

    if(nodes != null && nodes.length > 0) {
      //create a wrapper span element for the content
      SpanElement span = new SpanElement();
      //target this span with a class
      span.classes.add('rippleEffectContainer');

      LinkElement linkElement = document.head.querySelector("#rippleEffect");

      if (linkElement == null) {
        LinkElement el = _cssUtils.styleSheet('rippleEffect', _cssEffectStyles.rippleEffectStyles());
        document.head.insertBefore(el, document.head.querySelectorAll('link')[0]);
      }

      //inject retrieved content into newly created span element
      span.nodes.addAll(nodes);
      //add span element to the targeted element
      _element.nodes.clear();
      _element.nodes.add(span);

      _ripple(span);
    }
  }

  void attach() {
    _transclude();
  }

  RippleEffectDecorator(this._element, this._utils, this._cssUtils, this._cssEffectStyles);
}