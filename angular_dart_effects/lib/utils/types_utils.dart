library angular.dart.effects.types;

import 'package:angular/angular.dart';

class TypesUtilsModule extends Module {
  TypesUtilsModule(){
    bind(Types);
  }
}

@Injectable()
class Types {
  bool toBool(x) {
    if (x is bool) return x;
    if (x is num) return x != 0;
    return false;
  }
}