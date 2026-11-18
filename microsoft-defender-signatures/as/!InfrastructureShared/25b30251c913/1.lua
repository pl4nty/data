-- Threat: !InfrastructureShared
-- Name: 25b30251c913
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\windows\\", 1, true)) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1056.001", "keylog")
return mp.INFECTED
