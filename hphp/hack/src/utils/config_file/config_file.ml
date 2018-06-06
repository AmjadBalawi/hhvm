(**
 * Copyright (c) 2015, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the "hack" directory of this source tree.
 *
 *)

open Hh_core
open Sys_utils

type t = string SMap.t

let file_path_relative_to_repo_root = ".hhconfig"

(*
 * Config file format:
 * # Some comment. Indicate by a pound sign at the start of a new line
 * key = a possibly space-separated value
 *)
let parse_contents contents =
  let lines = Str.split (Str.regexp "\n") contents in
  List.fold_left lines ~f:begin fun acc line ->
    if String.trim line = "" || (String.length line > 0 && line.[0] = '#')
    then acc
    else
      let parts = Str.bounded_split (Str.regexp "=") line 2 in
      match parts with
      | [k; v] -> SMap.add (String.trim k) (String.trim v) acc
      | [k] -> SMap.add (String.trim k) "" acc
      | _ -> failwith "failed to parse config";
  end ~init:SMap.empty

let parse fn =
  let contents = try cat fn
    with e ->
      Hh_logger.exc ~prefix:".hhconfig deleted: " e;
      Exit_status.(exit Hhconfig_deleted) in
  let parsed = parse_contents contents in
  let hash = Sha1.digest contents in
  hash, parsed

module Getters = struct

  let string_opt key config =
    SMap.get key config

  let string_ key ~default config =
    Option.value (SMap.get key config) ~default

  let int_ key ~default config =
    Option.value_map (SMap.get key config) ~default ~f:int_of_string

  let bool_ key ~default config =
    Option.value_map (SMap.get key config) ~default ~f:bool_of_string

  let string_list ~delim key ~default config =
    Option.value_map (SMap.get key config) ~default ~f:(Str.split delim)

end
