-- Threat: !InfrastructureShared
-- Name: c5b3a6b06695
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0 = "remote_file_created_taint"
local l_0_1 = "queue_pid_taintfactory_a"
local l_0_2, l_0_3, l_0_4, l_0_5
if this_sigattrlog[2].matched then
  l_0_2 = this_sigattrlog[2].ppid
  l_0_3 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_2 = this_sigattrlog[3].ppid
  l_0_3 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched then
  l_0_2 = this_sigattrlog[4].ppid
  l_0_3 = this_sigattrlog[4].utf8p2
end
if not l_0_3 then
  return mp.CLEAN
end
local l_0_6 = mp.GetExecutablesFromCommandLine(l_0_3)
if l_0_6 then
  for l_0_7, l_0_8 in ipairs(l_0_6) do
    if sysio.IsFileExists(l_0_8) then
      l_0_4 = l_0_8
      break
    end
  end
end
if this_sigattrlog[5].matched then
  l_0_5 = this_sigattrlog[5].utf8p1
end
if l_0_2 ~= nil and l_0_4 ~= nil and l_0_5 ~= nil and not isParentPackageManager(l_0_2, true) and isTainted(l_0_4, l_0_0) then
  AppendToRollingQueue(l_0_1, l_0_2, 1, 600)
  taint(l_0_5, l_0_0, 3600)
  local l_0_9, l_0_10 = bm.get_process_relationships(l_0_2)
  for l_0_11, l_0_12 in ipairs(l_0_9) do
    bm.add_related_process(l_0_12.ppid)
    TrackPidAndTechniqueBM(l_0_12.ppid, "T1105", "CommandAndControl")
  end
  return mp.INFECTED
end
return mp.CLEAN
