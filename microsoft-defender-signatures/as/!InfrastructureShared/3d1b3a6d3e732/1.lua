-- Threat: !InfrastructureShared
-- Name: 3d1b3a6d3e732
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3]
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4]
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5]
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6]
elseif this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7]
elseif this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8]
elseif this_sigattrlog[9].matched then
  l_0_0 = this_sigattrlog[9]
elseif this_sigattrlog[10].matched then
  l_0_0 = this_sigattrlog[10]
elseif this_sigattrlog[11].matched then
  l_0_0 = this_sigattrlog[11]
elseif this_sigattrlog[12].matched then
  l_0_0 = this_sigattrlog[12]
elseif this_sigattrlog[13].matched then
  l_0_0 = this_sigattrlog[13]
elseif this_sigattrlog[14].matched then
  l_0_0 = this_sigattrlog[14]
elseif this_sigattrlog[15].matched then
  l_0_0 = this_sigattrlog[15]
elseif this_sigattrlog[16].matched then
  l_0_0 = this_sigattrlog[16]
elseif this_sigattrlog[17].matched then
  l_0_0 = this_sigattrlog[17]
elseif this_sigattrlog[18].matched then
  l_0_0 = this_sigattrlog[18]
elseif this_sigattrlog[19].matched then
  l_0_0 = this_sigattrlog[19]
elseif this_sigattrlog[20].matched then
  l_0_0 = this_sigattrlog[20]
end
if not l_0_0 or not l_0_0.utf8p1 then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p1
local l_0_2 = string.lower(l_0_1)
local l_0_3 = {
  "\\.claude\\",
  "\\.cursor\\rules\\",
  "\\.cursor\\rules",
  "\\.vscode\\",
  "\\.gemini\\",
  "\\.github\\",
  "\\.copilot\\",
  "\\.aider\\",
  "\\.windsurf\\"
}
if not contains(l_0_2, l_0_3, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1195.002", "shaiworm_agentcfg")
add_parents()
local l_0_4, l_0_5 = pcall(reportBmInfo)
if not l_0_4 and l_0_5 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_5), bm.RelatedStringBMReport)
end
return mp.INFECTED
