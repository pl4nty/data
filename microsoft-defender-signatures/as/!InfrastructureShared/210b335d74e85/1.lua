-- Threat: !InfrastructureShared
-- Name: 210b335d74e85
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[9].utf8p1
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[10].utf8p1
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[11].utf8p1
end
l_0_0 = sysio.ReadFile(l_0_1, 1, 3)
if l_0_1 and l_0_0 and l_0_0 == "ELF" then
  TrackPidAndTechniqueBM("BM", "T1021.004", "LateralMovement_SshConnectionInBruteDrop")
  reportRelatedBmHits()
  bm.add_related_file(l_0_1)
  return mp.INFECTED
end
return mp.CLEAN
