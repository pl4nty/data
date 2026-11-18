-- Threat: !InfrastructureShared
-- Name: 1e7b35c4f55f4
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
TrackPidAndTechniqueBM("BM", "T1543.001", "Persistence")
add_parents()
return mp.INFECTED
