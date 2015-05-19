// Copyright (c) 2015, AlexCD. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library angular.dart.effects;

import 'package:angular/angular.dart';
import 'package:angular_dart_effects/decorators/ripple_effect_deco.dart';

class AngularDartEffectsModule extends Module {
  AngularDartEffectsModule() {
    install(new RippleEffectDecoratorModule());
  }
}