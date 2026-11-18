-- Threat: !InfrastructureShared
-- Name: 65d76585aa9e
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.ppid == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetScannedPPID()
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.GetProcessCommandLine(l_0_1)
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = ""
l_0_2 = string.lower(l_0_2)
l_0_2 = string.gsub(l_0_2, "'", "\"")
l_0_2 = string.gsub(l_0_2, "\"\"", "\"")
if string.match(l_0_2, "stop[%s]*\"") then
  l_0_3 = string.match(l_0_2, "stop[%s]*\"([^\"]+)\"[%s]*")
else
  l_0_3 = string.match(l_0_2, "stop[%s]*(%S+)[%s]*")
end
if l_0_3 == "" or l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = {hpaudioanalytics = true, dellclientmanagementservice = true}
if l_0_4[l_0_3] then
  return mp.CLEAN
end
TrackPidAndTechnique(l_0_0.ppid, "T1489", "svc_stop_" .. l_0_3)
if TT_IsProdCriticalService(l_0_3) or IsDetectionThresholdMet(l_0_0.ppid) then
  AppendToRollingQueue("TT_ModifiedCriticalServices", l_0_3, "disabled", 3600)
  return mp.INFECTED
end
return mp.CLEAN
