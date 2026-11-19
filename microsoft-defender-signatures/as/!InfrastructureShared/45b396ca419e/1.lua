-- Threat: !InfrastructureShared
-- Name: 45b396ca419e
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil or #l_0_0 < 12 or string.lower(string.sub(l_0_0, -12)) ~= "\\taskmgr.exe" then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1003.001", "credentialdumping_concrete", 86400)
return mp.INFECTED
