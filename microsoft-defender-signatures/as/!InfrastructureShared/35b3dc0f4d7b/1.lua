-- Threat: !InfrastructureShared
-- Name: 35b3dc0f4d7b
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

local l_0_0 = "ExecutableNonTextSection"
if isnull(this_sigattrlog[1].utf8p1) or isnull(this_sigattrlog[2].utf8p1) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = string.match(this_sigattrlog[1].utf8p1, "OriginalPath:(.-)_OriginalSection:(.+)")
if isnull(l_0_1) or isnull(l_0_2) then
  return mp.CLEAN
end
bm.add_threat_file(l_0_1)
bm.add_threat_file(this_sigattrlog[2].utf8p1)
bm.add_related_string(l_0_0, safeJsonSerialize({
  Original = l_0_1,
  Embedded = this_sigattrlog[2].utf8p1,
  Section = l_0_2
}), bm.RelatedStringBMReport)
local l_0_3 = bm.get_current_process_startup_info()
if l_0_3 and l_0_3.ppid then
  TrackPidAndTechniqueBM(l_0_3.ppid, "T1027.009", "evasion_embeddedpe")
end
return mp.INFECTED
