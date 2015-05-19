library angular.dart.effects.styles;

import 'package:angular/angular.dart';

class CssEffectStylesModule extends Module {
  CssEffectStylesModule(){
    bind(CssEffectStyles);
  }
}

@Injectable()
class CssEffectStyles {
  String rippleEffectStyles() {
    String styles = """.rippleEffectContainer {
        display: inline-block;
        width: 100%;
        height: 100%;
        position: relative;
        overflow: hidden;
        vertical-align: bottom;
      }

  .ripple {
    display: block;
    position: absolute;
    background-color: #fff;
    border-radius: 50%;
    -webkit-transform: scale(0);
    -moz-transform: scale(0);
    -o-transform: scale(0);
    transform: scale(0);
    opacity: 0.3;
}

.ripple.animate {
    -webkit-animation: ripple 0.35s linear;
    -moz-animation: ripple 0.35s linear;
    -ms-animation: ripple 0.35s linear;
    -o-animation: ripple 0.35s linear;
    animation: ripple 0.35s linear;

    -webkit-backface-visibility: hidden;
    -webkit-perspective: 1000;
}

@-webkit-keyframes ripple {
    0% {
        opacity: 0.3;
    }
    100% {
        opacity: 0;
        -webkit-transform: scale(2.5);
    }
}

@-moz-keyframes ripple {
    0% {
        opacity: 0.3;
    }
    100% {
        opacity: 0;
        -moz-transform: scale(2.5);
    }
}

@-o-keyframes ripple {
    0% {
        opacity: 0.3;
    }
    100% {
        opacity: 0;
        -o-transform: scale(2.5);
    }
}

@keyframes ripple {
    0% {
        opacity: 0.3;
    }
    100% {
        opacity: 0;
        transform: scale(2.5);
    }
}""";

    return styles;
  }
}