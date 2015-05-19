// Copyright (c) 2015, AlexCD. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular/application_factory.dart';
import 'package:angular_dart_effects/angular_dart_effects.dart';

void main() {
  applicationFactory().addModule(new AngularDartEffectsModule()).run();
}