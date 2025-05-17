-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\28d72f7c8f47\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil or l_0_0.ppid == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetScannedPPID)()
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (mp.GetProcessCommandLine)(l_0_1)
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = ""
l_0_2 = (string.lower)(l_0_2)
l_0_2 = (string.gsub)(l_0_2, "\'", "\"")
l_0_2 = (string.gsub)(l_0_2, "\"\"", "\"")
if (string.match)(l_0_2, "/im[%s]*\"") then
  l_0_3 = (string.match)(l_0_2, "/im[%s]*\"([^\"]+)\"")
else
  l_0_3 = (string.match)(l_0_2, "/im[%s]*(%S+)")
end
if l_0_3 == "" or l_0_3 == nil then
  return mp.CLEAN
end
TrackPidAndTechnique(l_0_0.ppid, "T1489", "task_kill_" .. l_0_3)
if TT_IsProdCriticalService(l_0_3) then
  TrackPidAndTechnique(l_0_0.ppid, "T1489", "svc_stop_" .. l_0_3)
  AppendToRollingQueue("TT_ModifiedCriticalServices", l_0_3, "disabled", 3600)
  return mp.INFECTED
end
return mp.CLEAN

