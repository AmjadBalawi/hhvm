<?hh
/**
 * Copyright (c) 2014, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the "hack" directory of this source tree.
 *
 *
 */

function test(): int {
  $x = null;
  do {
    if (true) {
      continue;
    }
    $x = 0;
  } while (true);
  return $x;
}
