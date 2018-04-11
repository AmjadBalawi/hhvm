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

function f1(): mixed {
  if (true) {
    return 10;
  } else {
    return false;
  }
}

function f2(): void {
  $x = f1();
  $y = null;
  if (is_bool($x) && $x === false) {
    $y = 10;
  } else if (is_int($x)) {
    $y = $x;
  } else {
    return;
  }
  if (!is_int($y)) {
    return;
  }
  $y = $y + 10;
  echo $y;
}
