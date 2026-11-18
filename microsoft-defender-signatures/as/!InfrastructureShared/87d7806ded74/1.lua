-- Threat: !InfrastructureShared
-- Name: 87d7806ded74
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 == nil or l_0_1.ppid == nil or l_0_1.image_path == nil then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1.image_path)
if l_0_2:find("ltsvc.exe$") then
  return mp.CLEAN
end
if l_0_2:find("nucleon-service.exe$") then
  return mp.CLEAN
end
TrackPidAndTechnique(l_0_0, "T1490", "shadowcopy_delete")
if IsDetectionThresholdMet(l_0_0) or IsDetectionThresholdMet(l_0_1.ppid) or IsTacticObservedForPid(l_0_0, "wmi_childproc") then
  return mp.INFECTED
end
return mp.LOWFI
