-- Threat: !InfrastructureShared
-- Name: a5b35416fa2f
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 == nil then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1547.004", "persistence_source")
bm_AddRelatedFileFromCommandLine(l_0_0, nil, nil, 9)
return mp.INFECTED
