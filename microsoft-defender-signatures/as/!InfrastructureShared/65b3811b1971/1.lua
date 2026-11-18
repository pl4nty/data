-- Threat: !InfrastructureShared
-- Name: 65b3811b1971
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

local l_0_0 = "WinlogonHelper"
if not (not isnull(this_sigattrlog[4].utf8p1) and string.find(string.lower(this_sigattrlog[4].utf8p1), "^hkc?u")) or isnull(this_sigattrlog[4].utf8p2) or string.find(this_sigattrlog[4].utf8p2, "explorer%.exe$") then
  return mp.CLEAN
end
local l_0_1 = MpCommon.PathToWin32Path(string.match(this_sigattrlog[4].utf8p2, ";To:(.+)") or this_sigattrlog[4].utf8p2)
l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_1)
if isnull(l_0_1) then
  return mp.CLEAN
end
bm.add_threat_file(l_0_1)
bm.add_related_string(l_0_0, safeJsonSerialize({
  Shell = l_0_1,
  P1 = this_sigattrlog[4].utf8p1,
  P2 = this_sigattrlog[4].utf8p2
}), bm.RelatedStringBMReport)
local l_0_2 = bm.get_current_process_startup_info()
if l_0_2 and l_0_2.ppid then
  TrackPidAndTechniqueBM(l_0_2.ppid, "T1547.004", "persist_winlogon_shell")
end
return mp.INFECTED
