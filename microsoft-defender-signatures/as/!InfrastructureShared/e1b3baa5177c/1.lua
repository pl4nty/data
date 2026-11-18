-- Threat: !InfrastructureShared
-- Name: e1b3baa5177c
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib, LuaFuncHelper

local l_0_0
if this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p1
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[11].utf8p1
end
if l_0_0 ~= nil then
  taint(l_0_0, "remote_file_created_taint", 3600)
  local l_0_1 = bm.get_current_process_startup_info()
  local l_0_2, l_0_3 = bm.get_process_relationships(l_0_1.ppid)
  AppendToRollingQueue("queue_pid_taintfactory_a", l_0_1.ppid, 1, 600)
  for l_0_4, l_0_5 in ipairs(l_0_2) do
    bm.add_related_process(l_0_5.ppid)
    TrackPidAndTechniqueBM(l_0_5.ppid, "T1105", "CommandAndControl_RemoteFileCopy.A")
  end
  bm.trigger_sig("RemoteFileCopy", l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
