<?php

<<__EntryPoint>>
function main_substitutions2() {
var_dump(ini_get("hhvm.hot_func_count"));
var_dump(ini_get("hhvm.stats.slot_duration"));
var_dump(ini_get("hhvm.env_variables"));
var_dump(ini_get("hhvm.server_variables"));
var_dump(ini_get("hhvm.stats.max_slot"));
var_dump(ini_get("hhvm.server.thread_count"));
var_dump(ini_get("hhvm.server.connection_limit"));
var_dump(ini_get("hhvm.server.port"));
}
