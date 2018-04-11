(**
 * Copyright (c) 2015, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the "hack" directory of this source tree.
 *
 *)

(*****************************************************************************)
(* Functions dealing with old style local environment *)
(*****************************************************************************)

val intersect_fake :
  Typing_env.fake_members ->
  Typing_env.fake_members -> Typing_env.fake_members
val intersect :
  Typing_env.env ->
  Typing_env.local_env ->
  Typing_env.local_env ->
  Typing_env.local_env -> Typing_env.env
val integrate :
  Typing_env.env ->
  Typing_env.local_env ->
  Typing_env.local_env -> Typing_env.env
val integrate_list :
  Typing_env.env ->
  Typing_env.local_env ->
  Typing_env.local_env list -> Typing_env.env
val intersect_nonterminal_branches :
  Typing_env.env ->
  Typing_env.local_env ->
  (bool * Typing_env.local_env) list -> Typing_env.env
val fully_integrate :
  Typing_env.env ->
  Typing_env.local_env -> Typing_env.env
val env_with_empty_fakes :
  Typing_env.env -> Typing_env.env
