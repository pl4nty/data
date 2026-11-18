-- Threat: !InfrastructureShared
-- Name: 25d758cadf45
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 or (mp.GetProcessCommandLine(l_0_0) or "") ~= "webcache.exe" then
  return mp.CLEAN
end
local l_0_1 = string.lower(MpCommon.GetImagePathFromPid(l_0_0) or "")
if not l_0_1:find("appdata.-temp") then
  return mp.CLEAN
end
TrackPidAndTechnique("CMDHSTR", "T1574.001", "evasion_searchhijack_webcache")
return mp.INFECTED
