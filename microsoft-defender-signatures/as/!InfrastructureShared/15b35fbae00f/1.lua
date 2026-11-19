-- Threat: !InfrastructureShared
-- Name: 15b35fbae00f
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\program files", 1, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1003", "credentialdumping")
return mp.INFECTED
