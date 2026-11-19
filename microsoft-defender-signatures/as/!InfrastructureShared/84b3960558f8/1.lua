-- Threat: !InfrastructureShared
-- Name: 84b3960558f8
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2]
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3]
end
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.utf8p1 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.utf8p1)
if string.find(l_0_1, "\\windows\\", 1, true) then
  return mp.CLEAN
end
bm.add_related_file(l_0_1)
TrackPidAndTechniqueBM("BM", "T1037.001", "sysvol_logon_script_payload")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
