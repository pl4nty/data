-- Threat: !InfrastructureShared
-- Name: 7ab3c62d377d
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 == nil then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1037.001", "persistence_source")
bm_AddRelatedFileFromCommandLine(l_0_0, nil, nil, 1)
return mp.INFECTED
