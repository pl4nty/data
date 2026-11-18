-- Threat: !InfrastructureShared
-- Name: fad7372de7e5
-- Type: 21
-- Flags: 1
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 then
  local l_0_1 = string.lower(l_0_0.image_path)
  if string.find(l_0_1, "\\programdata\\microsoft\\azurewatson\\0\\awdumpifeo.exe", 1, true) or string.find(l_0_1, "\\windows\\system32\\werfault.exe", 1, true) or string.find(l_0_1, "\\windows\\syswow64\\werfault.exe", 1, true) then
    return mp.CLEAN
  end
end
local l_0_2 = mp.GetScannedPPID()
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
if not l_0_3 or #l_0_3 <= 18 then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
local l_0_4 = string.match(l_0_3, "[%-/]m[acdkmp] \"?([%d]+)\"?")
if not l_0_4 then
  return mp.CLEAN
end
l_0_4 = tonumber(l_0_4)
local l_0_5 = mp.GetPPidFromPid(l_0_4)
local l_0_6 = MpCommon.GetImagePathFromPid(l_0_5)
if not l_0_6 then
  return mp.CLEAN
end
if string.find(l_0_6:lower(), "\\windows\\system32\\lsass.exe", 1, true) then
  TrackPidAndTechnique("CMDHSTR", "T1003.001", "credentialdumping_concrete", 86400)
  return mp.INFECTED
end
return mp.CLEAN
