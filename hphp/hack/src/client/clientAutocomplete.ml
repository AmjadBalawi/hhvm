(**
 * Copyright (c) 2015, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the "hack" directory of this source tree.
 *
 *)

open Hh_core

let go results output_json =
  if output_json
  then begin
    let results =
      List.map results AutocompleteService.autocomplete_result_to_json
    in
    print_endline (Hh_json.json_to_string (Hh_json.JSON_Array results))
  end else begin
    List.iter results begin fun res ->
      let name = res.AutocompleteTypes.res_name in
      let ty = res.AutocompleteTypes.res_ty in
      print_endline (name^" "^ty)
    end
  end
