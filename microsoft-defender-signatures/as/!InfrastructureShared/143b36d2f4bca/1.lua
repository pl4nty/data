-- Threat: !InfrastructureShared
-- Name: 143b36d2f4bca
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

local l_0_0 = this_sigattrlog[4].matched and this_sigattrlog[4] or this_sigattrlog[5]
if isnull(l_0_0) or isnull(l_0_0.utf8p1) or isnull(l_0_0.utf8p2) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = string.match(l_0_0.utf8p2, "injectiontype:(.-);(.*)")
local l_0_3, l_0_4 = string.match(l_0_0.utf8p1, "imagename:.+;targetprocessppid:(%d+):(%d+)$")
if isnull(l_0_3) or isnull(l_0_4) then
  return mp.CLEAN
end
local l_0_5 = string.format("pid:%d,ProcessStart:%d", l_0_3, l_0_4)
local l_0_6, l_0_7 = string.match(l_0_0.utf8p2, "apcoriginalprocessppid:(%d+):(%d+);")
local l_0_8
if not isnull(l_0_6) and not isnull(l_0_7) then
  l_0_8 = string.format("pid:%d,ProcessStart:%d", l_0_6, l_0_7)
end
local l_0_9 = "processinjection_wmplayer"
local l_0_10 = safeJsonSerialize({
  Target = l_0_0.utf8p1,
  Type = l_0_1,
  Info = l_0_2 or "N/A"
})
bm.add_related_string(l_0_9, l_0_10, bm.RelatedStringBMReport)
local l_0_11 = bm.get_current_process_startup_info()
if l_0_11 and l_0_11.ppid then
  TrackPidAndTechniqueBM(l_0_11.ppid, "T1055.001", l_0_9)
end
bm.add_related_process(l_0_5)
TrackPidAndTechniqueBM(l_0_5, "T1055.001", string.format("%s_target", l_0_9))
if l_0_8 then
  bm.add_related_process(l_0_8)
  TrackPidAndTechniqueBM(l_0_8, "T1055.001", string.format("%s_source", l_0_9))
end
return mp.INFECTED
