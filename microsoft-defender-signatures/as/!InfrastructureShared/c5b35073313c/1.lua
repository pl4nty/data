-- Threat: !InfrastructureShared
-- Name: c5b35073313c
-- Type: 21
-- Includes: TechniqueTracker

if not this_sigattrlog[3].matched or this_sigattrlog[3].utf8p1 == nil or this_sigattrlog[3].utf8p1 == "" or this_sigattrlog[3].utf8p2 == nil or this_sigattrlog[3].utf8p2 == "" then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
if string.find(l_0_0, "/library/application support/lemon/lemon", 0, true) or string.find(l_0_0, "lemon.app/contents/library/loginitems/lemon", 0, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1070.002", "ClearSystemLogs")
return mp.INFECTED
