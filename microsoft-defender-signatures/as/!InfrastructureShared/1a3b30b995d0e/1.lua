-- Threat: !InfrastructureShared
-- Name: 1a3b30b995d0e
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0, l_0_1
local l_0_2 = bm.GetProcedureMatchDuration(0)
local l_0_3 = bm.GetProcedureMatchDuration(1)
if l_0_2 > l_0_3 then
  l_0_1 = l_0_2 - l_0_3
else
  l_0_1 = l_0_3 - l_0_2
end
if 50000000 < l_0_1 then
  return mp.CLEAN
end
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[9].matched then
  l_0_0 = this_sigattrlog[9].utf8p1
end
if isTainted(l_0_0, "remote_file_created_taint") then
  if string.find(l_0_0, "/usr/lib/yum-plugins/enabled_repos_upload.py", 1, true) == 1 then
    return mp.CLEAN
  end
  local l_0_4 = bm.get_current_process_startup_info()
  if l_0_4 and l_0_4.ppid and l_0_4.ppid ~= "" then
    AppendToRollingQueue("queue_pid_taintfactory_a", l_0_4.ppid, 1, 600)
    AppendToRollingQueue("queue_pid_tainted_scripts", l_0_4.ppid, l_0_0, 3600, 500)
    bm.trigger_sig("BMExecutionFromTaintedScript", l_0_0)
    return mp.INFECTED
  end
end
return mp.CLEAN
