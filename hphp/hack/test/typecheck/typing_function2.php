<?hh // strict
/**
 * Copyright (c) 2014, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the "hack" directory of this source tree.
 *
 *
 */

class C {
  public static function f(int $x): int {
    return 0;
  }
}

function test(): void {
  $y = call_user_func(fun('C::f'), 32);
}
