-- Threat: !InfrastructureShared
-- Name: 4a7b3e58fbf59
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil and this_sigattrlog[10].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p1
  l_0_1 = this_sigattrlog[10].utf8p2
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 and this_sigattrlog[11].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[11].utf8p1
  l_0_1 = this_sigattrlog[11].utf8p2
elseif this_sigattrlog[12].matched and this_sigattrlog[12].utf8p1 and this_sigattrlog[12].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[12].utf8p1
  l_0_1 = this_sigattrlog[12].utf8p2
elseif this_sigattrlog[13].matched and this_sigattrlog[13].utf8p1 and this_sigattrlog[13].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[13].utf8p1
  l_0_1 = this_sigattrlog[13].utf8p2
elseif this_sigattrlog[14].matched and this_sigattrlog[14].utf8p1 and this_sigattrlog[14].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[14].utf8p1
  l_0_1 = this_sigattrlog[14].utf8p2
elseif this_sigattrlog[15].matched and this_sigattrlog[15].utf8p1 and this_sigattrlog[15].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[15].utf8p1
  l_0_1 = this_sigattrlog[15].utf8p2
elseif this_sigattrlog[16].matched and this_sigattrlog[16].utf8p1 and this_sigattrlog[16].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[16].utf8p1
  l_0_1 = this_sigattrlog[16].utf8p2
elseif this_sigattrlog[17].matched and this_sigattrlog[17].utf8p1 and this_sigattrlog[17].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[17].utf8p1
  l_0_1 = this_sigattrlog[17].utf8p2
elseif this_sigattrlog[18].matched and this_sigattrlog[18].utf8p1 and this_sigattrlog[18].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[18].utf8p1
  l_0_1 = this_sigattrlog[18].utf8p2
elseif this_sigattrlog[19].matched and this_sigattrlog[19].utf8p1 and this_sigattrlog[19].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[19].utf8p1
  l_0_1 = this_sigattrlog[19].utf8p2
end
if l_0_0 == "" or l_0_0 == nil or l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_0 .. "|" .. l_0_1
bm.add_related_string("file_metadata", l_0_2, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1080", "LateralMovement_TaintSharedContent_MountedScriptExecution")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
