-- Threat: !InfrastructureShared
-- Name: 45db37fabbeb1
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[7].matched and not this_sigattrlog[8].matched and not this_sigattrlog[9].matched and not this_sigattrlog[10].matched then
  return mp.CLEAN
end
local l_0_0 = "unknown"
if this_sigattrlog[10].matched then
  l_0_0 = "MazeStyle"
elseif this_sigattrlog[7].matched then
  l_0_0 = "DebuggerKillList"
elseif this_sigattrlog[8].matched then
  l_0_0 = "AnalystToolKillList"
elseif this_sigattrlog[9].matched then
  l_0_0 = "RansomPrepOffice"
end
bm.add_related_string("amsi_variant", l_0_0, bm.RelatedStringBMReport)
local l_0_1
if this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[11].utf8p1
elseif this_sigattrlog[12].matched and this_sigattrlog[12].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[12].utf8p1
elseif this_sigattrlog[13].matched and this_sigattrlog[13].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[13].utf8p1
elseif this_sigattrlog[14].matched and this_sigattrlog[14].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[14].utf8p1
elseif this_sigattrlog[15].matched and this_sigattrlog[15].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[15].utf8p1
elseif this_sigattrlog[16].matched and this_sigattrlog[16].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[16].utf8p1
end
if l_0_1 ~= nil then
  local l_0_2 = string.match(string.lower(l_0_1), "imagename:([^;]+)")
  if l_0_2 ~= nil then
    bm.add_related_string("inject_target", l_0_2, bm.RelatedStringBMReport)
  end
end
add_parents()
TrackPidAndTechniqueBM("BM", "T1489", "AntiAnalysisProcKill")
TrackPidAndTechniqueBM("BM", "T1055", "AntiAnalysisProcKill")
return mp.INFECTED
